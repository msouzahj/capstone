json.array!(@events) do |event|
  json.extract! event, :id, :name, :results, :meet_id
  json.url event_url(event, format: :json)
end
