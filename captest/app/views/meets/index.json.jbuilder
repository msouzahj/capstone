json.array!(@meets) do |meet|
  json.extract! meet, :id, :name, :date, :notes, :season_id
  json.url meet_url(meet, format: :json)
end
