class HomeController < ApplicationController
  def new
    weather = Weather.last
    unless weather.nil?
      weather_id = weather.weather_id
      if weather_id == 800
        @is_raining = false
      else
        @is_raining = true
      end
    else
      @is_rainning = false
    end
  end
end
