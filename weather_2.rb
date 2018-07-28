#https://learn.skillcrush.com/module-18/step-2-make-your-weather-app-a-forecasting-weather-app/
#https://darksky.net/dev/docs
#https://github.com/darkskyapp/forecast-ruby

require 'barometer'

puts "Where are you (city, zipcode, landmark, or Woe ID)"
location = gets.chomp

barometer = Barometer.new(location)
weather = barometer.measure

# note, the date is the date of the locations weather, not the date of the
# user measuring the weather
date = Time.new
#date = Date.parse(date)
weather.for(date)       # returns the first successful forecast_measurement for the date

puts date
puts weather.for(date)    #.high.f

forecast = weather.forecast
temp = weather.current.temperature.f
condition = weather.current.condition

if condition != nil
  puts "The temperature is #{temp} and it is #{condition} today!"
else
  puts "The temperature is #{temp} today!"
end

puts forecast
#puts weather.inspect
#puts condition.inspect
#puts weather.methods
