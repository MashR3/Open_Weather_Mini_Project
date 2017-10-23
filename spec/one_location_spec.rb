require 'spec_helper'

describe "weather single location" do

  before(:each) do
    weather = WeatherServices.new
    @api_tests = weather.one_location_weather('London')
  end

  it 'has the code 200 for a successful https response' do
    expect(@api_tests['cod']).to be == 200
  end

  it 'returns "name" key as a string' do
    expect(@api_tests['name']).to be_kind_of(String)
  end

  it 'returns an integer ID' do
    expect(@api_tests['id']).to be_kind_of(Integer)
  end

  it 'returns an 8-digit ID' do
    expect((@api_tests['id']).size).to equal(8)
  end

  context 'has a "base" key which' do
    it 'is present' do
      expect(@api_tests).to have_key('base')
    end

    it 'is a string' do
      expect((@api_tests)['base']).to be_kind_of(String)
    end
  end

  context 'Coordinates hash has two keys which' do
    it 'are longitude and latitude' do
      expect(@api_tests['coord']).to have_key('lon' && 'lat')
    end

    it 'will only return longitude values within a (+ -)180 range' do
      expect(@api_tests['coord']['lon']).to be_between(-180, 180)
    end

    it 'will only return latitude values within a (+ -)90 range' do
      expect(@api_tests['coord']['lat']).to be_between(-90, 90)
    end
  end

  context 'Each weather hash have the four same keys' do
     it 'contains keys: id, main, description, and icon' do
       @api_tests['weather'].each do |i|
       expect(i.keys).to contain_exactly('id', 'main', 'description', 'icon')
     end
    end
   end

   it 'returns temperature as a float' do
     expect(@api_tests['main']['temp']).to be_kind_of(Float)
   end

   it 'returns temp min and max as a float' do
     expect(@api_tests['main']['temp_min']).to be_kind_of(Float)
     expect(@api_tests['main']['temp_max']).to be_kind_of(Float)
   end

  it 'will return the correct description for the weather id' do
    @api_tests['weather'].each do |i|

      if i['id'] == 800
        expect i['main'].to be == 'Clear'

      elsif i['id'] == 711
        expect i['main'].to be == 'Smoke'
      end
    end
  end

end

# @json['colors'].each do |i|
#   expect(i).to have_key('color')
# end

# OR The more static, non dynamic way ==>
#   expect @json['colors'][0].keys.include?'color'
#   expect @json['colors'][1].keys.include?'color'
