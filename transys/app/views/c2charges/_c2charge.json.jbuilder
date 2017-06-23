json.extract! c2charge, :id, :paid, :amount, :currency, :refunded, :created_at, :updated_at
json.url c2charge_url(c2charge, format: :json)
