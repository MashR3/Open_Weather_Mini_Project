require 'spec_helper'
require 'yaml'

# Multiple city weather service tests
describe "weather multiple locations" do

# before all, instantiate the class in variable 'weather' and the run the tests on the instance variable of running the method on it.
  before(:all) do # Avoids making multiple calls to the server for each test.
    climate = WeatherServices.new # Instantiate the class
    codes = YAML.load_file('ids.yml') # load in the yaml file full of unique city IDs
    @multiple = climate.more_locations_weather(codes.sample(2)) # code.sample(2) chooses 2 random IDs from the entire YAML file.
  end

  # Check multiple sets of data is being returned
  it 'have a count of more than 1' do
    expect(@multiple['cnt']).to be > 1
  end

  # Make sure there are multiple sets of data
  it 'should countain 2 hashes of data' do
    expect(@multiple['list'].count).to equal(2)
  end

  # Returns multiple data in correct format
  it 'contains each set of data in a hash' do
    expect(@multiple['list'][0]).to be_kind_of(Hash)
    expect(@multiple['list'][1]).to be_kind_of(Hash)
  end

  it 'contains "country" as a key' do
    expect(@multiple['list'][0]['sys']).to have_key('country')
  end

  it 'contains country code as string' do
    expect(@multiple['list'][0]['sys']['country']).to be_kind_of(String)
  end

end
