json.array!(@charges) do |charge|
  json.extract! charge, :id
  json.url charge_url(charge, format: :json)
end
