#this does not work. I don't think the Barometer-yahoo, noaa, forecast_io gem works
#https://learn.skillcrush.com/module-18/step-2-make-your-weather-app-a-forecasting-weather-app/
#https://apidock.com/ruby/DateTime/strftime

require 'barometer'

def get_location_weather(location)
  Barometer.new(location).measure
end

weather = get_location_weather('Chicago')
tomorrow = Time.now.strftime('%d').to_i + 1 #the day-of-month number

#puts tomorrow so "tomorrow" works

weather.forecast.each do |forecast|
  day = forecast.starts_at.day

  if day == tomorrow
    dayName = 'Tomorrow'
  else
    dayName = forecast.starts_at.strftime('%A') #the day of the week
  end

  puts dayName = ' is going to be' + forecast.icon + ' with a low of' + forecast.low.f.to_s + ' and a high of ' + forecast.high.f.to_s
end
