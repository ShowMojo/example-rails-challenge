# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed customers
# Customer.create(first_name: "Johny", last_name: "Flow")
# Customer.create(first_name: "Raj", last_name: "Jamnis")
# Customer.create(first_name: "Andrew", last_name: "Chung")
# Customer.create(first_name: "Mike", last_name: "Smith")

# Seed charges
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "1", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "1", customer_id: "1")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "1", customer_id: "1")

Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "2")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "2")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "2")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "1", customer_id: "2")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "1", customer_id: "2")

Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "3")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "0", amount: "4900", currency: "usd", refunded: "0", customer_id: "3")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "0", amount: "4900", currency: "usd", refunded: "0", customer_id: "3")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "0", amount: "4900", currency: "usd", refunded: "0", customer_id: "3")

Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "1", amount: "4900", currency: "usd", refunded: "0", customer_id: "4")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "0", amount: "4900", currency: "usd", refunded: "0", customer_id: "4")
Charge.create(created: DateTime.strptime("1389618241", '%s'), paid: "0", amount: "4900", currency: "usd", refunded: "0", customer_id: "4")