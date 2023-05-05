
require 'net/http'
require 'json'
require 'net/smtp'

def do_geocoding_query(city_name, api_key)
    uri = URI("http://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&limit=1&appid=#{api_key}")
    response = Net::HTTP.get(uri)
    results = JSON.parse(response)
    return results[0]
end

def get_geocoding_for_city(city, api_key)
    geocoding = do_geocoding_query(city, api_key)
    city_name    = geocoding["name"] # Get the name of the city as displayed on the API
    local_name   = geocoding["local_names"]["en"] # Get the local name of the city as given by the API in english
    latitude     = geocoding["lat"] # Gets the latitude
    longitude    = geocoding["lon"] # Gets the longitude

    # puts "City Name #{city_name}\nLocal name (EN) #{local_name}\nLatitude #{latitude}\nLongitude #{longitude}"
    return [city_name, local_name, latitude, longitude]
end

