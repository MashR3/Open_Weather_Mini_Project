require 'json'

json = JSON.parse(File.read('city_list.json'))

list = json

File.open("city_code.yml", "w+") do |f|
  list.each do |i|
    f << "- #{i['id']} \n"
  end
end
