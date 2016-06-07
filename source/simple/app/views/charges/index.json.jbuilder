json.array!(@charges) do |charge|
  json.extract! charge, :id, :paid, :amount, :currency, :refunded, :customer
  json.url charge_url(charge, format: :json)
end
