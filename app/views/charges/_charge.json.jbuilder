json.extract! charge, :id, :paid, :currency, :amount, :refunded, :customer, :created_at, :updated_at
json.url charge_url(charge, format: :json)
