class HomeController < ApplicationController
  def new
    weather = Weather.last
    @is_raining = false
    @is_snowing = false
    unless weather.nil?
      weather_id = weather.weather_id
      if 600 <= weather_id && weather_id <= 622
        @is_snowing = true
        @is_cloudy = true
      elsif weather_id < 800
        @is_raining = true
        @is_cloudy = true
      elsif weather_id == 800
        @is_raining = false
        @is_cloudy = false
      else
        @is_cloudy = true
      end
    end
  end
end
