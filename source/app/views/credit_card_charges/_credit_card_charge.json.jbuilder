json.extract! credit_card_charge, :id, :customer_id, :paid, :amount, :currency, :refunded, :created_at, :updated_at
json.url credit_card_charge_url(credit_card_charge, format: :json)
