json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :created, :paid, :amount, :currency, :refunded, :customer_id
  json.url transaction_url(transaction, format: :json)
end
