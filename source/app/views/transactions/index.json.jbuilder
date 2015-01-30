json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :paid, :amount, :currency, :refunded, :customer_id, :disputed
  json.url transaction_url(transaction, format: :json)
end
