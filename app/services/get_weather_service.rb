class GetWeatherService
  require 'net/http'
  require 'json'
  def initialize(params)
    @city = params
  end

  def call
    url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&APPID="+ENV.fetch('OPENWEATHER_MAP_API_KEY')
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    p data
  end
end
