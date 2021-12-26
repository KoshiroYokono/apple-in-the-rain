class HomeController < ApplicationController
  def new
    weather = Weather.last
    @is_cloudy = false
    @is_raining = false
    unless weather.nil?
      weather_id = weather.weather_id
      @is_cloudy = false
      if weather_id < 800
        @is_raining = true
      elsif weather_id == 800
        @is_raining = false
      else
        @is_cloudy = true
      end
    end
  end
end
