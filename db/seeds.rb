# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(first_name: 'Johny', last_name: 'Flow')
Customer.create(first_name: 'Raj', last_name: 'Jamnis')
Customer.create(first_name: 'Andrew', last_name: 'Chung')
Customer.create(first_name: 'Mike', last_name: 'Smith')

# 10 Should be successful transactions
Charge.create(paid: true, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 4000, currency: "usd", refunded: false, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 5000, currency: "usd", refunded: false, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 3000, currency: "cent", refunded: false, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 4000, currency: "usd", refunded: false, customer_id: Customer.second.id)
Charge.create(paid: true, amount: 7000, currency: "cent", refunded: false, customer_id: Customer.second.id)
Charge.create(paid: true, amount: 9000, currency: "usd", refunded: false, customer_id: Customer.second.id)
Charge.create(paid: true, amount: 8000, currency: "usd", refunded: false, customer_id: Customer.third.id)
Charge.create(paid: true, amount: 9000, currency: "cent", refunded: false, customer_id: Customer.fourth.id)

# 5 Should be transactions that failed
Charge.create(paid: false, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.third.id)
Charge.create(paid: false, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.third.id)
Charge.create(paid: false, amount: 5000, currency: "usd", refunded: false, customer_id: Customer.third.id)
Charge.create(paid: false, amount: 3000, currency: "usd", refunded: false, customer_id: Customer.fourth.id)
Charge.create(paid: false, amount: 4000, currency: "cent", refunded: false, customer_id: Customer.fourth.id)

# 5 should be disputed

Charge.create(paid: true, amount: 3000, currency: "usd", refunded: true, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 4000, currency: "usd", refunded: true, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 5000, currency: "cent", refunded: true, customer_id: Customer.first.id)
Charge.create(paid: true, amount: 3000, currency: "cent", refunded: true, customer_id: Customer.second.id)
Charge.create(paid: true, amount: 4000, currency: "usd", refunded: true, customer_id: Customer.second.id)