# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#####
##
## Add Customers
##
#####

custs = [
  "Jonny Flow",
  "Raj Jamnis",
  "Andrew Chung",
  "Mike Smith"
]

custs.each do |cust|
  Customer.create(first_name: cust.split(" ")[0], last_name: cust.split(" ")[1])
end

########

#####
##
##Successful transactions
##

cust = Customer.find(1)
(1..10).each do |i|
  cust = Customer.find(2) if i == 6
  cust = Customer.find(3) if i == 9
  cust = Customer.find(4) if i == 10

  CreditCardCharge.create(paid: true, amount: rand(50000), customer: cust)
end

#####
##
##Failed transactions
##

cust = Customer.find(3)
(1..5).each do |i|
  cust = Customer.find(4) if i == 4

  CreditCardCharge.create(paid: false, amount: rand(50000), customer: cust)
end

#####
##
##Disputed transactions
##
cust = Customer.find(1)
(1..5).each do |i|
  cust = Customer.find(2) if i == 4

  CreditCardCharge.create(paid: true, amount: rand(50000), refunded: true, customer: cust)
end
