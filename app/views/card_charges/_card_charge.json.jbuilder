json.extract! card_charge, :id, :created, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url card_charge_url(card_charge, format: :json)
