module Api
  module OpenWeatherMap
    class Request
      URI = "https://api.openweathermap.org/data/2.5/weather"
      attr_accessor :query

      def initialize
        @query = {
          lat: "35.7402",
          lon: "139.6845",
          appid: ENV["OPEN_WEATHER_API_KEY"],
        }
      end
      # Thunderstorm 2xx
      # Drizzle	3xx
      # Rain 5xx
      # Snow 6xx
      # Clear	800
      # Clouds 80x

      def request
        client = HTTPClient.new
        request = client.get(URI, query) # 戻り値は3時間ごとのデータ5日分
        JSON.parse(request.body)
      end

      def self.weather_id_from(response:)
        { weather_id: response['weather'][0]['id'] }
      end

    end
  end
end
