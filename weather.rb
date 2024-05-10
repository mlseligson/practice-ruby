require 'net/http'
require 'geocoder'
require 'json'



def get_weather(city)
  api_key = "9c918e56526115f2d615d876982c9f93"

  location = Geocoder.search(city).first
  lat = location.latitude
  lon = location.longitude
  uri = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{api_key}")

  return JSON.parse(Net::HTTP.get_response(uri).body)
end

def get_temps(weather)
  temps = ""
  weather["main"].each do |k, v|
    if k.to_s.match(/temp/)
      fahrenheit = (v - 273.15) * (9.0 / 5) + 32
      temps += "#{k}: #{fahrenheit.round(2)}°F\t"
    end
  end

  return "Temperature:\t\t" + temps
end

def get_weather_description(weather)
  return "Weather Description:\t#{weather["weather"][0]["main"]}/#{weather["weather"][0]["description"]}"
end

puts "Enter address or city:"
weather = get_weather(gets.chomp)

puts "The weather in #{weather["name"]} right now:"
puts get_temps(weather)
puts get_weather_description(weather)
