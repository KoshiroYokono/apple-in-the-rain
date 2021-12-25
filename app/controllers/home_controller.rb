class HomeController < ApplicationController
  def new
    weather = Weather.first
    unless weather.nil?
      
      weather_id = weather.weather_id
      if weather_id == 800
        @is_rainning = false
      else
        @is_rainning = true
      end
    else
      @is_rainning = false
    end
  end
end
