class HomeController < ApplicationController
  def new
    weather = Weather.last
    @is_raining = false
    @is_snowing = false
    unless weather.nil?
      weather_id = weather.weather_id
      @is_cherry_bllosoming = spring_now?
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

  private

  def spring_now?
    Time.zone.now.month == 4
  end
end
