require 'HTTParty'
require 'json'
require 'yaml'

class WeatherServices
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5/weather'

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def one_location_weather(city)
    JSON.parse(self.class.post("?q={city}" + "#{@token}").body)
  end

end

  # def more_location_weather(city_array)
  # #   JSON.parse(self.class.post("/postcodes", body: {"postcodes" => postcodes_array}).body)
  # end

weather = WeatherServices.new
puts weather.one_location_weather("London")
