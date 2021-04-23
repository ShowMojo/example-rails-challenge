# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Customer.create(first_name: "Johny", last_name: "Flow")
Customer.create(first_name: "Raj", last_name: "Jamnis")
Customer.create(first_name: "Andrew", last_name: "Chung")
Customer.create(first_name: "Mike", last_name: "Smith")

# 10 Should be successful Charges:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

Charge.create(paid: true, amount: 10.50, currency: 'usd', customer_id: 1)
Charge.create(paid: true, amount: 150, currency: 'usd', customer_id: 1)
Charge.create(paid: true, amount: 20, currency: 'usd', customer_id: 1)
Charge.create(paid: true, amount: 30, currency: 'usd', customer_id: 1)
Charge.create(paid: true, amount: 45, currency: 'usd', customer_id: 1)

Charge.create(paid: true, amount: 10.50, currency: 'usd', customer_id: 2)
Charge.create(paid: true, amount: 150, currency: 'usd', customer_id: 2)
Charge.create(paid: true, amount: 20, currency: 'usd', customer_id: 2)

Charge.create(paid: true, amount: 30, currency: 'usd', customer_id: 3)

Charge.create(paid: true, amount: 45, currency: 'usd', customer_id: 4)


# 5 Should be Charges that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4

Charge.create(paid: false, amount: 45, currency: 'usd', refunded: true, customer_id: 3)
Charge.create(paid: false, amount: 45, currency: 'usd', refunded: true, customer_id: 3)
Charge.create(paid: false, amount: 45, currency: 'usd', refunded: true, customer_id: 3)

Charge.create(paid: false, amount: 45, currency: 'usd', refunded: true, customer_id: 4)
Charge.create(paid: false, amount: 45, currency: 'usd', refunded: true, customer_id: 4)

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2

Charge.create(paid: true, amount: 45, currency: 'usd', refunded: true, customer_id: 1)
Charge.create(paid: true, amount: 45, currency: 'usd', refunded: true, customer_id: 2)
