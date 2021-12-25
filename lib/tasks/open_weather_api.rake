namespace :open_weather_api do
  desc "fetch weather_id per 3 hour"
  task fetch_weather_id: :environment do
    weather_id = Api::OpenWeatherMap.fetch_weather_id
    Weather.create(weather_id: weather_id)
  end
end
