class HomeController < ApplicationController
  def new
    open_weather = Api::OpenWeatherMap::Request.new
    response = open_weather.request
    weather_id = Api::OpenWeatherMap::Request.weather_id_from(response: response)
    if weather_id == 800
      @is_rainning = false
    else
      @is_rainning = true
    end
  end
end
