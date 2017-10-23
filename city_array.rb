require 'json'

json = JSON.parse(File.read('city_list.json'))

@list = json[0]["id"]



json.each do |i|
  File.write('city_code.yml', "- #{i['id']}")
end
