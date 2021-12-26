class Weather < ApplicationRecord
  attribute :created_at, :datetime, default: -> { Time.zone.now }
  attribute :updated_at, :datetime, default: -> { Time.zone.now }
end
