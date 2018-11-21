class GetWeatherService
  require 'net/http'
  require 'json'
  def initialize(params)
    @city = params
  end

  def call
    response = get_response(@city)

    if response['cod'] == '404'
      {'cod' => '404', 'message' => 'city not found'}
    else
      add_city(@city)
      response
    end
  end

  private

  def get_response(city)
    url =
      "https://api.openweathermap.org/data/2.5/weather?q=#{city}"\
      "&APPID=#{ENV.fetch('OPENWEATHER_MAP_API_KEY')}"
    url = URI.encode(url)
    resp = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(resp.body)
  end

  def add_city(city)
    CreateCityService.new(city).call
  end
end
