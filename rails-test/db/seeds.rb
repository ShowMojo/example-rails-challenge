# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Customers
Customer.create!(first_name: 'Johny', last_name: 'Flow')
Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
Customer.create!(first_name: 'Andrew', last_name: 'Chung')
Customer.create!(first_name: 'Mike', last_name: 'Smith')

# Charges
# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

5.times do
  Charge.create!(customer: Customer.find(1), amount: 100, currency: "usd")
end
3.times do
  Charge.create!(customer: Customer.find(2), amount: 100, currency: "usd")
end
Charge.create!(customer: Customer.find(3), amount: 100, currency: "usd")
Charge.create!(customer: Customer.find(4), amount: 100, currency: "usd")

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4

3.times do
  Charge.create!(customer: Customer.find(3), amount: 100, paid: false, currency: "usd")
end
2.times do
  Charge.create!(customer: Customer.find(4), amount: 100, paid: false, currency: "usd")
end

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2

3.times do
  Charge.create!(customer: Customer.find(1), amount: 100, currency: "usd", refunded: true)
end

2.times do
  Charge.create!(customer: Customer.find(2), amount: 100, currency: "usd", refunded: true)
end
