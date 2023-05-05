require 'dotenv/load'
require_relative 'api'

city = "Guatemala"
api_key = ENV['OPENWEATHER_API_KEY']

print get_geocoding_for_city(city, api_key)