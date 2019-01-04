# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# All Customers
johny = Customer.create(first_name: "Johny", last_name: "Flow")
raj = Customer.create(first_name: "Raj", last_name: "Jamis")
andrew = Customer.create(first_name: "Andrew", last_name: "Chung")
mike = Customer.create(first_name: "Mike", last_name: "Smith")

# All Successfull Transactions
5.times do
  Transaction.create(paid: true, refunded: false, customer: johny, amount: rand(1..1000), status: Transaction::STATUS[:successful])
end
3.times do
  Transaction.create(paid: true, refunded: false, customer: raj, amount: rand(1..1000), status: Transaction::STATUS[:successful])
end
Transaction.create(paid: true, refunded: false, customer: andrew, amount: rand(1..1000), status: Transaction::STATUS[:successful])
Transaction.create(paid: true, refunded: false, customer: mike, amount: rand(1..1000), status: Transaction::STATUS[:successful])

# All Failed transactions
3.times do
  Transaction.create(paid: true, refunded: false, customer: andrew, amount: rand(1..1000), status: Transaction::STATUS[:failed])
end
2.times do
  Transaction.create(paid: true, refunded: false, customer: mike, amount: rand(1..1000), status: Transaction::STATUS[:failed])
end

# All Disputed transactions
3.times do
  Transaction.create(paid: true, refunded: false, customer: johny, amount: rand(5_000), status: Transaction::STATUS[:disputed])
end
2.times do
  Transaction.create(paid: true, refunded: false, customer: raj, amount: rand(5_000), status: Transaction::STATUS[:disputed])
end
