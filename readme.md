#Open Weather Testing

A service allowing the user to test the services offered by the Open Weather Testing API, by wrapping up the methods in a single class.

## Install 
Run the following commands in your terminal to get the required gem dependencies   
``` gem install HTTParty```  
``` gem install yaml ```  
``` gem install json ```  
``` gem install rspec ```

## Technologies Used

* Ruby - 2.4.1
* Rspec - 3.6
* YAML - 1.2
* HTTParty - 0.15.6
* JSON - 2.1.0

## Overview

This product was built using Ruby. A WeatherService class has been built to hold the methods for getting current weather data from the OpenWeatherTesting API. The data is then parsed through JSON to allow the user to create their own automated tests.

## Examples of Usage

An example of the single current weather call: 

	def one_location_weather(city)
	  JSON.parse(self.class.get("/weather?q=#{city}" + "#{@token}").body)
	end 
	
	context 'Each weather hash have the four same keys' do
	  it 'contains keys: id, main, description, and icon' do
	    @api_tests['weather'].each do |i|
	      expect(i.keys).to contain_exactly('id', 'main', 'description', 'icon')
	     end
	    end
	   end
In this example, the data is obtained by passing the city name as a string onto the base uri. This can also be achieved using:  
```api.openweathermap.org/data/2.5/weather?q={city name}```
```api.openweathermap.org/data/2.5/weather?q={city name},{country code}```  
*or, with city id:*  
```api.openweathermap.org/data/2.5/weather?id=2172797```  

An example of the multiple city current weather call  

	def more_locations_weather(location_array)
	   JSON.parse(self.class.get("/group?id=" + "#{location_array.map{ |id| id }.join(',')}" + "&units=metric" + "#{@token}").body)
	end
	  
	it 'contains each set of data in a hash' do
	  expect(@multiple['list'][0]).to be_kind_of(Hash)
	   expect(@multiple['list'][1]).to be_kind_of(Hash)
	end

 

### Additional Information

The Open Weather Map API only allows use if one has an access key, associated with a (free or paid) user account. The creator access key is coded into the get/post requests, but is hidden from view in a .yml file hidden in .gitignore.  
>To use the service, create a file named 'token.yml' in the root file and enter your unique access code in the form "token: {your ID}". 


To use the 'multiple city' service (where the user inputs up to 20 city IDs), the product must can be allowed to search a known list of city IDs. At present, there are over 21,000 different city IDs. It would take a lot of time to iterate through this data to check the validity of each city ID.



