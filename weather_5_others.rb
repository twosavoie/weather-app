#I copied this code from another SK student (KyKnight). Condition & temp work, forecast doesn't.
require 'barometer'

def get_locations_weather(location)
	@barometer = Barometer.new(location).measure
end

puts "What is your location? Enter a zipcode, city, state, or landmark."
location = gets.chomp.downcase
weather = get_locations_weather (location)

puts "Your current weather is " + weather.current.condition + " with the temperature of " + weather.current.temperature.f.to_s + "F.\n\n"

tomorrow = Time.now.strftime('%d').to_i + 1

weather.forecast.each do |forecast|
	day = forecast.starts_at.day

	if day == tomorrow
		dayName = "Tomorrow"
	else
		dayName = forecast.starts_at.strftime('%A')
	end

	puts dayName +" is going to be " + forecast.icon + " with a low of " + forecast.low.f.to_s + "F and a high of " + forecast.high.f.to_s + "F."
end


#I copied this from another SK student (Anna) doesn't work past asking for zip code. Looks copied/adapted from SK answer.
require 'barometer'


puts "Where are you located? 5-Digit Zip"
location = gets.chomp

barometer = Barometer.new(location)
weather = barometer.measure

#variables in forecast loop

today = Time.now.strftime("%d").to_i
tomorrow = today + 1

#print forecast results

weather.forecast.each do |forecast|
  day = forecast.starts_at.day

    if day == today
      dayName = 'Today'
    else
      dayName = forecast.starts_at.strftime('%A')
      puts dayName + " count on a " + forecast.icon + " day with a high of " + forecast.high.f.to_s + " and a low of " + forecast.low.f.to_s + "."
    end # if statement
  end #for loop
