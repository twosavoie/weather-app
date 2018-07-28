#https://learn.skillcrush.com/module-18/step-1-create-your-weather-script/


require 'barometer'

puts "Where are you (city, zipcode, landmark, or Woe ID)"
location = gets.chomp

barometer = Barometer.new(location)
weather = barometer.measure

temp = weather.current.temperature.f
condition = weather.current.condition

if condition != nil
  puts "The temperature is #{temp} and it is #{condition} today!"
else
  puts "The temperature is #{temp} today!"
end
#puts weather.inspect
#puts condition.inspect
#puts weather.methods
