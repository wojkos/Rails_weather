class WeathersController < ApplicationController
  def home
    @city = cookies[:city]
  end

  def create
    validator = CityNameValidator::Schema.call(city: params[:city])
    if validator.success?
      cookies[:city] = params[:city]
      session[:weather] = GetWeatherService.new(params[:city]).call
      @cities.add(params[:city])
      redirect_to weather_path(params[:city])
    else
      render :home
    end
  end
  def show
    @city_weather = session[:weather]
  end
end
