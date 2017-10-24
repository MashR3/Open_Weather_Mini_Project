#Open Weather Testing

A service allowing the user to request current weather data for a single city by city name or by city name and the country name.

## Basics

This product was built using Ruby. Data obtained through the API service was returned in JSON, and parsed into a hash, allowing automated tests to be created with RSpec.

## Usage

### Current Weather Data - Single City  

#### By City name

Calling by city name will make the service respond with a list of results matching the searching word.

Requesting use of the single service requires an API call in the form:
 ```api.openweathermap.org/data/2.5/weather?q={city name}```   
 ```api.openweathermap.org/data/2.5/weather?q={city name},{country code}```

 **Note:** The city name and country code are divided by a comma  
 **Note:** Use ISO 3166 country codes

#### By City ID

Calling by city ID will ensure the API responds with an exact result.

 Requesting use of the single service requires an API call in the form:
 ```api.openweathermap.org/data/2.5/weather?id=2172797```

 where **2172797** is a unique ID corresponding to a specific location.

 **Note:** It is recommended to call API by city ID to get an unambiguous result for your city


### Current Weather Data - Multiple City

 Requesting use of the multiple service requires an API call in the form:



## Key Information

The Open Weather Map API only allows use if one has an access key, associated with a (free or paid) user account. The creator access key is coded into the get/post requests, but is hidden from view.

To use the 'multiple city' service (where the user inputs up to 20 city IDs), the product must communicate with a known list of city IDs. At present, there are over 21,000 different city IDs. It takes a condiserable amount of time to iterate through this data to check that each city ID input is valid, and then to return an error. Implementing a search bar by city or ID, with a drop down menu would remove the need to test whether the ID is valid.

## Technologies Used

* Ruby - 2.4.1
* Rspec - 3.6
* YAML - 1.2
* HTTParty - 0.15.6
* JSON - 2.1.0
