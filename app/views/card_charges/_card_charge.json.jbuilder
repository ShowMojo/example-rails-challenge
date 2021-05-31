json.extract! card_charge, :id, :paid, :amount, :refunded, :customer_id, :created_at, :updated_at
json.url card_charge_url(card_charge, format: :json)
