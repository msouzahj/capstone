json.array!(@timers) do |timer|
  json.extract! timer, :id, :saved_times, :user_id
  json.url timer_url(timer, format: :json)
end
