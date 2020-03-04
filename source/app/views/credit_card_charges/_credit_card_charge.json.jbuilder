json.extract! credit_card_charge, :id
json.created credit_card_charge.created_at.to_time.to_i
json.paid credit_card_charge.paid
json.amount credit_card_charge.amount_in_cents
json.currency credit_card_charge.currency
json.refunded credit_card_charge.refunded
json.customer_id credit_card_charge.customer_id
json.url credit_card_charge_url(credit_card_charge, format: :json)
