json.array!(@credits) do |credit|
  json.extract! credit, :id, :paid, :amount, :currency, :refunded, :customer_id
  json.url credit_url(credit, format: :json)
end
