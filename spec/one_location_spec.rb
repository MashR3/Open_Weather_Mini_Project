require 'spec_helper'

describe "weather single location" do

  before(:each) do
    weather = WeatherServices.new
    @api_tests = weather.one_location_weather('London')
  end

  it 'has country name as a string' do
    expect @api_tests['result']['postcode'].should include (" ")
  end
