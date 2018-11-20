class WeathersController < ApplicationController
  def home
    @cities = %w[Warsaw Berlin Tokio Paris New\ York]
  end

  def create
    validator = CityNameValidator::Schema.call(city: params[:city])
    if validator.success?
      session[:weather] = GetWeatherService.new(params[:city]).call
      redirect_to weather_path(params[:city])
    else
      render :home
    end
  end
  def show
    @city_weather = session[:weather]
  end
end
