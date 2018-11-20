class WeathersController < ApplicationController
  def home
    @cities = City.most_checked.pluck(:name)
    @city = cookies[:city]
  end

  def create
    validator = CityNameValidator::Schema.call(city: params[:city])
    if validator.success?
      get_weather = GetWeatherService.new(params[:city]).call
      if get_weather['cod'] == '404'
        redirect_to root_path, alert: get_weather['message'].capitalize
      else
        session[:weather] = get_weather
        cookies[:city] = params[:city]
        redirect_to weather_path(params[:city])
      end
    else
      redirect_to root_path, alert: validator.errors.to_s
    end
  end

  def show
    if session[:weather]
      @city_weather = session[:weather]
    else
      redirect_to root_path
    end
  end
end
