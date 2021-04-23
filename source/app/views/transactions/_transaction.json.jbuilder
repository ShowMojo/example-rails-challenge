json.extract! transaction, :id, :created, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
