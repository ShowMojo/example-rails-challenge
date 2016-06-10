# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer_1 = Customer.create(first_name: "Johny", last_name: "Flow")
customer_2 = Customer.create(first_name: "Raj", last_name: "Jamnis")
customer_3 = Customer.create(first_name: "Andrew", last_name: "Chung")
customer_4 = Customer.create(first_name: "Mike", last_name: "Smith")

5.times { customer_1.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: false) }
3.times { customer_2.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: false) }
customer_3.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: false)
customer_4.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: false)
3.times { customer_3.charges.create(paid: false, amount: rand(10000), currency: "usd", refunded: false) }
2.times { customer_4.charges.create(paid: false, amount: rand(10000), currency: "usd", refunded: false) }
3.times { customer_1.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: true) }
2.times { customer_2.charges.create(paid: true, amount: rand(10000), currency: "usd", refunded: true) }