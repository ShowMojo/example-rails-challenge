##### Seed 4 Customers into the system
customer_one = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_two = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_three = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_four = Customer.create(first_name: 'Mike', last_name: 'Smith')

##### Seed 20 transactions (charges) into the system
5.times do
  customer_one.charges.create(paid: true, amount: rand(1000), currency: 'usd', refunded: false)
end

3.times do
  customer_two.charges.create(paid: true, amount: rand(1000), currency: 'usd', refunded: false)
end

customer_three.charges.create(paid: true, amount: rand(1000), currency: 'usd', refunded: false)

customer_four.charges.create(paid: true, amount: rand(1000), currency: 'usd', refunded: false)

3.times do
  customer_three.charges.create(paid: false, amount: rand(1000), currency: 'usd', refunded: false)
end

2.times do
  customer_four.charges.create(paid: false, amount: rand(10000), currency: 'usd', refunded: false)
end

3.times do
  customer_one.charges.create(paid: true, amount: rand(10000), currency: 'usd', refunded: true)
end

2.times do
  customer_two.charges.create(paid: true, amount: rand(10000), currency: 'usd', refunded: true)
end