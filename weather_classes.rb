require 'HTTParty'
require 'json'
require 'yaml'

class WeatherServices
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def one_location_weather(city)
    JSON.parse(self.class.post("/weather?q={city}" + "#{@token}").body)
  end

  def more_locations_weather(city1,city2)
    JSON.parse(self.class.get("/group?id=" + "#{city1}" + "," + "#{city2}" + "&units=metric" + "#{@token}").body)
  end

end

# weather = WeatherServices.new
# puts weather.one_location_weather("London")

# weather = WeatherServices.new
# puts weather.more_locations_weather("819827","524901")
