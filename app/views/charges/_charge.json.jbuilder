json.extract! charge, :id, :customer_id, :paid, :price, :currency, :refunded, :created_at, :updated_at
json.url charge_url(charge, format: :json)
