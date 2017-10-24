require 'HTTParty'
require 'json'
require 'yaml'

# Overarching class to hold the methods for all the services provided by the one API
class WeatherServices
  include HTTParty
  # The base link for all the possible services. A layer of abstraction
  base_uri 'https://api.openweathermap.org/data/2.5'

  # To access the "token"(personal access key). The key is in .ymml and so needs to be initialized and loaded in to be accessible.
  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  # Single location service. The token is string interpolated in, as the api service is only accessible logged in
  def one_location_weather(city)
    JSON.parse(self.class.get("/weather?q=#{city}" + "#{@token}").body)
  end

  # Broken thus far multiple location service.
  def more_locations_weather(location_array)
     JSON.parse(self.class.get("/group?id=" + "#{location_array.map{ |id| id }.join(',')}" + "&units=metric" + "#{@token}").body)
    #  JSON.parse(self.class.get("/group?id=" + "#{city1}" + "," + "#{city2}" + "&units=metric" + "#{@token}").body)
  end

end

# https://api.openweathermap.org/data/2.5/weather?q=london&APPID=a04136bdb6ae3db876ec9eb9d65948bc

weather = WeatherServices.new
puts weather.one_location_weather('london')

# weather = WeatherServices.new
# puts weather.more_locations_weather("819827","524901")

# def tests(location_array)
#   "/group?id=" + "#{location_array.map{|id| id }.join(',')}" + "&units=metric" + "#{@token}"
# end
# puts tests(["707860", "519188"])
