# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Customer.create(firstname: "Johny",lastname: "Flow")
Customer.create(firstname: "Raj", lastname: "Jamnis")
Customer.create(firstname: "Andrew",lastname: "Chung")
Customer.create(firstname: "Mike",lastname: "Smith")

##########################SUCCESS############################
Credit.create(paid: true, refunded: false,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 2,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 2,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 2,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 3,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: false,customer_id: 4,amount: 23,currency: "USD")

##############################FAILED############################
Credit.create(paid: false,customer_id: 3,amount: 23,currency: "USD")
Credit.create(paid: false,customer_id: 3,amount: 23,currency: "USD")
Credit.create(paid: false,customer_id: 3,amount: 23,currency: "USD")
Credit.create(paid: false,customer_id: 4,amount: 23,currency: "USD")
Credit.create(paid: false,customer_id: 4,amount: 23,currency: "USD")

#############################DISPUTED###############################
Credit.create(paid: true, refunded: true,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: true,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: true,customer_id: 1,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: true,customer_id: 2,amount: 23,currency: "USD")
Credit.create(paid: true, refunded: true,customer_id: 2,amount: 23,currency: "USD")