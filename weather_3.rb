#https://www.wunderground.com maybe I can pull something from this site to get the forecast
#https://rubygems.org/gems/weather-forecasts maybe this would be good? https://github.com/alakra/weather-forecasts
#include the previous code to ask for a location
#http://ravi4rubyonrails.blogspot.com/2011/08/usage-of-barometer-gem.html this might also be helpful
#see 5 for other studen's work
require 'barometer'

puts "Where are you (city, zipcode, landmark, or Woe ID)"
location = gets.chomp

barometer = Barometer.new(location)
weather = barometer.measure
#puts weather.methods
puts weather.forecast
puts weather.forecast.inspect
puts weather.current.temperature.f.inspect
#end gives object id & temp

#doesn't do anything, doesn't return error
def get_location(location)
  Barometer.new(location).measure
end

weather = get_location(location)

weather.forecast.each do |forecast|
 puts forecast.starts_at.month.to_s + '/' + forecast.starts_at.day.to_s + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end

#doesn't do anything, doesn't return error
def get_location_weather(location)
  Barometer.new(location).measure
end

weather = get_location_weather('Chicago')
tomorrow = Time.now.strftime('%d').to_i + 1

weather.forecast.each do |forecast|
  day = forecast.starts_at.day

  if day == tomorrow
    dayName = 'Tomorrow'
  else
    dayName = forecast.starts_at.strftime('%A') #the day of the week
  end

  puts dayName = ' is going to be' + forecast.icon + ' with a low of' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end


#these just do not work.
#require 'barometer'
#require 'barometer-forecast_io'
#query = Barometer::Query.new('42.7243,-73.6927')
#keys = {api: 'forecast io apikey'}
#result = Barometer::ForecastIo.call(query, keys: key)
#puts result.current.temperature.c
