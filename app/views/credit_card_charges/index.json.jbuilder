json.array!(@credit_card_charges) do |credit_card_charge|
  json.extract! credit_card_charge, :id, :created, :paid, :amount, :currency, :refunded, :customer_id
  json.url credit_card_charge_url(credit_card_charge, format: :json)
end
