# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "----------- Cleaning data ------------------"
Customer.destroy_all

puts "----- Seeding customers ----------"

customers = [
  {
    first_name: 'Johny',
    last_name: 'Flow'
  },
  {
    first_name: 'Raj',
    last_name: 'Jamnis'
  },
  {
    first_name: 'Andrew',
    last_name: 'Chung'
  },
  {
    first_name: 'Mike',
    last_name: 'Smith'
  }
]

customers = Customer.create(customers)

puts "----- Seeding charges ----------"
puts "--------------------- Successful transactions"

successful_charge = {paid: true, currency: 'usd', refunded: false}

5.times do
  customers[0].charges.create(successful_charge.merge!(amount: rand(9..99)))
end

3.times do
  customers[1].charges.create(successful_charge.merge!(amount: rand(9..99)))
end

customers[2].charges.create(successful_charge.merge!(amount: rand(9..99)))

customers[3].charges.create(successful_charge.merge!(amount: rand(9..99)))

puts "--------------------- Failed transactions"

failed_charge = {paid: false, currency: 'usd', refunded: false}

3.times do
  customers[2].charges.create(failed_charge.merge!(amount: rand(9..99)))
end

2.times do
  customers[3].charges.create(failed_charge.merge!(amount: rand(9..99)))
end

puts "--------------------- Disputed transactions"

disputed_transaction = {paid: true, currency: 'usd', refunded: true}

3.times do
  customers[0].charges.create(disputed_transaction.merge!(amount: rand(9..99)))
end

2.times do
  customers[1].charges.create(disputed_transaction.merge!(amount: rand(9..99)))
end

puts "------------------------ SUMMARY ---------------------"
puts "Customers: #{Customer.all.count}"
puts "Charges: #{Charge.all.count}"