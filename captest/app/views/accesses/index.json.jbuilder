json.array!(@accesses) do |access|
  json.extract! access, :id, :meets_id, :seasons_id, :events_id
  json.url access_url(access, format: :json)
end
