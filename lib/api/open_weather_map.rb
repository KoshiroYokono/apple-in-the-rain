module Api
  class OpenWeatherMap
    URI = "https://api.openweathermap.org/data/2.5/weather"
    LATTITUDE = "35.7402"
    LONGITUDE = "139.6845"
    attr_accessor :query

    def initialize
      @query = {
        lat: LATTITUDE,
        lon: LONGITUDE,
        appid: ENV["OPEN_WEATHER_API_KEY"],
      }
    end
    # Thunderstorm 2xx
    # Drizzle	3xx
    # Rain 5xx
    # Snow 6xx
    # Clear	800
    # Clouds 80x

    def self.fetch_weather_id
      open_weather_map_api_client = Api::OpenWeatherMap.new
      open_weather_map_api_client.request['weather'][0]['id']
    end

    def request
      client = HTTPClient.new
      request = client.get(URI, query) # 戻り値は3時間ごとのデータ5日分
      JSON.parse(request.body)
    end
  end
end
