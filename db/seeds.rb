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

Charge.create(paid: true, refunded: false, customer_id: 2, amount: 78.6, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 2, amount: 68.4, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 2, amount: 123.2, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 1, amount: 68.4, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 1, amount: 123.2, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 1, amount: 78.6, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 1, amount: 68.4, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 3, amount: 68.4, currency: "usd")
Charge.create(paid: true, refunded: false, customer_id: 4, amount: 68.4, currency: "usd")

Charge.create(paid: false, refunded: false, customer_id: 3, amount: 123.4, currency: "usd")
Charge.create(paid: false, refunded: false, customer_id: 3, amount: 321.4, currency: "usd")
Charge.create(paid: false, refunded: false, customer_id: 3, amount: 43.2, currency: "usd")
Charge.create(paid: false, refunded: false, customer_id: 4, amount: 654.44, currency: "usd")
Charge.create(paid: false, refunded: false, customer_id: 4, amount: 688.43, currency: "usd")

Charge.create(paid: false, refunded: true, customer_id: 1, amount: 628.41, currency: "usd")
Charge.create(paid: false, refunded: true, customer_id: 1, amount: 685.41, currency: "usd")
Charge.create(paid: false, refunded: true, customer_id: 1, amount: 68.74, currency: "usd")
Charge.create(paid: false, refunded: true, customer_id: 2, amount: 168.41, currency: "usd")
Charge.create(paid: false, refunded: true, customer_id: 2, amount: 681.43, currency: "usd")
 