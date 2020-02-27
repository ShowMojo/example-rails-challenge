json.extract! transaction, :id, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
