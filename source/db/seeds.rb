# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Customer.first_or_create(first_name: 'Johny', last_name: 'Flow')
c2 = Customer.first_or_create(first_name: 'Raj', last_name: 'Jamnis')
c3 = Customer.first_or_create(first_name: 'Andrew', last_name: 'Chung')
c4 = Customer.first_or_create(first_name: 'Mike', last_name: 'Smith')

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2

for i in 1..5 do
  c1.charges.create(created: Time.now.to_i, amount: rand(10000))
end
for i in 1..3 do
  c2.charges.create(created: Time.now.to_i, amount: rand(10000))
end
c3.charges.create(created: Time.now.to_i, amount: rand(10000))
c4.charges.create(created: Time.now.to_i, amount: rand(10000))

for i in 1..3 do
  c3.charges.create(created: Time.now.to_i, paid: false, amount: rand(10000))
end
for i in 1..2 do
  c4.charges.create(created: Time.now.to_i, paid: false, amount: rand(10000))
end

for i in 1..3 do
  c1.charges.create(created: Time.now.to_i, paid: false, amount: rand(10000), refunded: true)
end
for i in 1..2 do
  c2.charges.create(created: Time.now.to_i, paid: false, amount: rand(10000), refunded: true)
end