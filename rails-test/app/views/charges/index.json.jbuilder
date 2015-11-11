json.array!(@charges) do |charge|
  json.extract! charge, :id, :references, :paid, :amount, :refunded
  json.url charge_url(charge, format: :json)
end
