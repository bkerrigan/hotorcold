class Address < ApplicationRecord
  validates :postal_code, presence: true

  after_create :get_weather

  serialize :weather_data, Hash

  def get_weather
    # Return cached weather data if it is less than 30 minutes old
    return weather_data if weather_data && updated_at > 30.minutes.ago

    api_key = Rails.application.credentials[:weather_api_key]
    unit_type = if country_code == 'us'
                  'imperial'
                else
                  'metric'
                end

    uri = URI("https://api.openweathermap.org/data/2.5/weather?zip=#{postal_code},#{country_code}&units=#{unit_type}&appid=#{api_key}")
      #"http://api.openweathermap.org/data/2.5/#{type}?q=#{URI.encode(name)}&units=imperial&appid=#{api_key}")

    # Download and parse the JSON from the api
    self.weather_data = JSON.parse(Net::HTTP.get(uri))
    save
    weather_data
  end

  def self.geocode_address(address)
    address_regex = /(?<city>[^,]+),\s(?<state>[A-Z]{2})\s*(?<zip>\d{5})?(?:[-\s]\d{4})?/
    results = Geocoder.search(address, params: {countrycodes: "us,ca"})
    if results.empty?
      matched = address.match(address_regex)
      if matched
        new_address = if matched['zip']
                        matched['zip']
                      else
                        "#{matched['city']}, #{matched['state']}"
                      end
        results = Geocoder.search(new_address)
      end
    end
    results.first
  end
end
