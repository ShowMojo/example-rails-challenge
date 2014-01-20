# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

customer1 = Customer.create(first_name: "Johny", last_name: "Flow")
customer2 = Customer.create(first_name: "Raj", last_name: "Jamnis")
customer3 = Customer.create(first_name: "Andrew", last_name: "Chung")
customer4 = Customer.create(first_name: "Mike", last_name: "Smith")

5.times do
  Charge.create(customer: customer1, paid: true, ammount: rand(1..1000), refounded: false)
end

3.times do
  Charge.create(customer: customer2, paid: true, ammount: rand(1..1000), refounded: false)
end

Charge.create(customer: customer3, paid: true, ammount: rand(1..1000), refounded: false)
Charge.create(customer: customer4, paid: true, ammount: rand(1..1000), refounded: false)

3.times do
  Charge.create(customer: customer3, paid: false, ammount: rand(1..1000), refounded: false)
end

2.times do
  Charge.create(customer: customer4, paid: false, ammount: rand(1..1000), refounded: false)
end

3.times do
  Charge.create(customer: customer1, paid: true, ammount: rand(1..1000), refounded: true)
end

2.times do
  Charge.create(customer: customer2, paid: true, ammount: rand(1..1000), refounded: true)
end

