# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_attributes = [
  { first_name: 'Johny', last_name: 'Flow' },
  { first_name: 'Raj', last_name: 'Jamnis' },
  { first_name: 'Andrew', last_name: 'Chung' },
  { first_name: 'Mike', last_name: 'Smith' }
]

customers = customer_attributes.map { |attributes| Customer.create(attributes) }

# SUCCESSFUL TRANSACTIONS
5.times do
  Charge.create(
    paid: true,
    amount: rand(50..100),
    refunded: false,
    customer: customers[0]
  )
end

3.times do
  Charge.create(
    paid: true,
    amount: rand(50..100),
    refunded: false,
    customer: customers[1]
  )
end

Charge.create(
  paid: true,
  amount: rand(50..100),
  refunded: false,
  customer: customers[2]
)

Charge.create(
  paid: true,
  amount: rand(50..100),
  refunded: false,
  customer: customers[3]
)

# FAILED TRANSACTIONS
3.times do
  Charge.create(
    paid: false,
    amount: rand(50..100),
    customer: customers[2]
  )
end

2.times do
  Charge.create(
    paid: false,
    amount: rand(50..100),
    customer: customers[3]
  )
end

# DISPUTED TRANSACTIONS
3.times do
  Charge.create(
    paid: true,
    amount: rand(50..100),
    refunded: true,
    customer: customers[0]
  )
end

2.times do
  Charge.create(
    paid: true,
    amount: rand(50..100),
    refunded: true,
    customer: customers[1]
  )
end
