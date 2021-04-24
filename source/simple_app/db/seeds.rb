# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')

customer2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')

customer3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')

customer4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

5.times do
  Charge.create!(customer_id: customer1.id, amount: 50, refunded: false, paid: true, created: Time.now)
end

3.times do
  Charge.create!(customer_id: customer2.id, amount: 50, refunded: false, paid: true, created: Time.now)
end

Charge.create!(customer_id: customer3.id, amount: 100, refunded: false, paid: true, created: Time.now)
Charge.create!(customer_id: customer4.id, amount: 200, refunded: false, paid: true, created: Time.now)

# failed
3.times do
  Charge.create!(customer_id: customer3.id, amount: 50, refunded: false, paid: false, created: Time.now)
end
2.times do
  Charge.create!(customer_id: customer4.id, amount: 50, refunded: false, paid: false, created: Time.now)
end

# disputed
3.times do
  Charge.create!(customer_id: customer1.id, amount: 50, refunded: true, paid: true, created: Time.now)
end

2.times do
  Charge.create!(customer_id: customer2.id, amount: 150, refunded: true, paid: true, created: Time.now)
end
