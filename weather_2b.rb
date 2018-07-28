require 'barometer'

puts "Where are you (city, zipcode, landmark, or Woe ID)"
location = gets.chomp

barometer = Barometer.new(location)
weather = barometer.measure

temp = weather.current.icon #current.temperature.f  #icon and condition give me usable data, condition more readable

puts temp.to_s
#puts weather.methods
#puts weather.inspect
