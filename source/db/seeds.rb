# Customers
#
customer_1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# Transaction
#
transaction = {
  created: Time.now.to_i,
  paid: true,
  amount: rand(10000),
  currency: 'USD',
  refunded: false
}

# Successful
#
5.times do
  customer_1.charges.create(transaction)
end

3.times do
  customer_2.charges.create(transaction)
end

customer_3.charges.create(transaction)
customer_4.charges.create(transaction)

# Failed
#
3.times do
  customer_3.charges.create(transaction.merge(paid: false))
end

2.times do
  customer_4.charges.create(transaction.merge(paid: false))
end

# Disputed
#
3.times do
  customer_1.charges.create(transaction.merge(refunded: true))
end

2.times do
  customer_2.charges.create(transaction.merge(refunded: true))
end
