json.array!(@credit_card_operations) do |credit_card_operation|
  json.extract! credit_card_operation, :id, :paid, :amount, :currency, :refunded
  json.url credit_card_operation_url(credit_card_operation, format: :json)
end
