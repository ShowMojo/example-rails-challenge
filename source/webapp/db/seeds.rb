# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Customer 1
customer_1 = Customer.create(first_name: "Johny", last_name: "Flow")
#Customer 2
customer_2 = Customer.create(first_name: "Raj", last_name: "Jamnis")
#Customer 3
customer_3 = Customer.create(first_name: "Andrew", last_name: "Chung")
#Customer 4
customer_4 = Customer.create(first_name: "Mike", last_name: "Smith")

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
		Charge.create(paid: true, currency: "usd", amount: 5000, refunded: false, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 7500, refunded: false, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 4900, refunded: false, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 5900, refunded: false, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 6300, refunded: false, customer_id: customer_1.id)
#   - 3 Should be linked to Customer 2
		Charge.create(paid: true, currency: "usd", amount: 8000, refunded: false, customer_id: customer_2.id)
		Charge.create(paid: true, currency: "usd", amount: 9700, refunded: false, customer_id: customer_2.id)
		Charge.create(paid: true, currency: "usd", amount: 8500, refunded: false, customer_id: customer_2.id)
#   - 1 Should be linked to Customer 3
		Charge.create(paid: true, currency: "usd", amount: 6200, refunded: false, customer_id: customer_3.id)
#   - 1 Should be linked to Customer 4
		Charge.create(paid: true, currency: "usd", amount: 4400, refunded: false, customer_id: customer_4.id)

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
		Charge.create(paid: false, currency: "usd", amount: 3300, refunded: false, customer_id: customer_3.id)
		Charge.create(paid: false, currency: "usd", amount: 9300, refunded: false, customer_id: customer_3.id)
		Charge.create(paid: false, currency: "usd", amount: 7300, refunded: false, customer_id: customer_3.id)		
#   - 2 Should be linked to Customer 4
		Charge.create(paid: false, currency: "usd", amount: 7100, refunded: false, customer_id: customer_4.id)
		Charge.create(paid: false, currency: "usd", amount: 8600, refunded: false, customer_id: customer_4.id)

# 5 should be disputed:
#   - 3 should be linked to Customer 1
		Charge.create(paid: true, currency: "usd", amount: 9900, refunded: true, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 9000, refunded: true, customer_id: customer_1.id)
		Charge.create(paid: true, currency: "usd", amount: 3800, refunded: true, customer_id: customer_1.id)
#   - 2 should be linked to customer 2
		Charge.create(paid: true, currency: "usd", amount: 7700, refunded: true, customer_id: customer_2.id)
		Charge.create(paid: true, currency: "usd", amount: 4400, refunded: true, customer_id: customer_2.id)