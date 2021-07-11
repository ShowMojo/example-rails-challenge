# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add 4 Customers
customer_1 = Customer.find_or_create_by(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.find_or_create_by(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.find_or_create_by(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.find_or_create_by(first_name: 'Mike', last_name: 'Smith')

# Add 10 Successful transactions
## Add 5 transactions to Customer 1
5.times do
  Charge.create(paid: true, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_1)
end
## Add 3 transactions to Customer 2
3.times do
  Charge.create(paid: true, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_2)
end
## Add 1 transaction to Customer 3
Charge.create(paid: true, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_3)
## Add 1 transaction to Customer 4
Charge.create(paid: true, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_4)

# Add 5 failed transactions
## Add 3 transactions to Customer 3
3.times do
  Charge.create(paid: false, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_3)
end
## Add 3 transactions to Customer 4
2.times do
  Charge.create(paid: false, refunded: false, currency: 'usd', amount: rand(1000..10000), customer: customer_4)
end

# Add 5 disputed transactions
## Add 3 transactions to Customer 1
3.times do
  Charge.create(paid: true, refunded: true, currency: 'usd', amount: rand(1000..10000), customer: customer_1)
end
## Add 3 transactions to Customer 2
2.times do
  Charge.create(paid: true, refunded: true, currency: 'usd', amount: rand(1000..10000), customer: customer_2)
end