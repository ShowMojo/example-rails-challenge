json.extract! product, :id, :created, :paid, :amount, :currency, :refunded, :customer_id, :created_at, :updated_at
json.url product_url(product, format: :json)
