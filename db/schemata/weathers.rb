create_table :weathers do |t|
  t.integer :weather_id,
        null: false
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
end
