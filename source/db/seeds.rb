customer_1 = Customer.create(first_name: "Customer", last_name: "1")
customer_2 = Customer.create(first_name: "Customer", last_name: "2")
customer_3 = Customer.create(first_name: "Customer", last_name: "3")
customer_4 = Customer.create(first_name: "Customer", last_name: "4")

successful_transaction_attributes = {
  created: Time.now.to_i,
  paid: true,
  amount: 10_000,
  currency: "usd",
  refunded: false,
}

failed_transaction_attributes = successful_transaction_attributes.merge(paid: false)

disputed_transaction_attributes = successful_transaction_attributes.merge(refunded: true)

# Successful

5.times do |i|
  customer_1.charges.create(successful_transaction_attributes)
end

3.times do |i|
  customer_2.charges.create(successful_transaction_attributes)
end

customer_3.charges.create(successful_transaction_attributes)
customer_4.charges.create(successful_transaction_attributes)

# Failed

3.times do |i|
  customer_3.charges.create(failed_transaction_attributes)
end

2.times do |i|
  customer_4.charges.create(failed_transaction_attributes)
end

# Disputed

3.times do |i|
  customer_1.charges.create(disputed_transaction_attributes)
end

2.times do |i|
  customer_2.charges.create(disputed_transaction_attributes)
end
