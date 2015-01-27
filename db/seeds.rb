# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


customer1 = Mycustomer.create(firstName: 'Johny', lastName: 'Flow')
customer2 = Mycustomer.create(firstName: 'Raj', lastName: 'Jamnis' )
customer3 = Mycustomer.create(firstName: 'Andrew', lastName: 'Chung' )
customer4 = Mycustomer.create(firstName: 'Mike', lastName: 'Smith' )

# Successful transactions
customer1.transactions.create([{ paid: true, amount: 4900, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: true, amount: 5900, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: true, amount: 6900, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: true, amount: 1900, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: true, amount: 4900, currency: "usd", refunded: false }])
customer2.transactions.create([{ paid: true, amount: 2300, currency: "usd", refunded: false }])
customer2.transactions.create([{ paid: true, amount: 3600, currency: "usd", refunded: false }])
customer2.transactions.create([{ paid: true, amount: 4200, currency: "usd", refunded: false }])
customer3.transactions.create([{ paid: true, amount: 6900, currency: "usd", refunded: false }])
customer4.transactions.create([{ paid: true, amount: 3900, currency: "usd", refunded: false }])

# Failed transactions
customer3.transactions.create([{ paid: false, amount: 5300, currency: "usd", refunded: true }])
customer3.transactions.create([{ paid: false, amount: 6900, currency: "usd", refunded: true }])
customer3.transactions.create([{ paid: false, amount: 5900, currency: "usd", refunded: true }])
customer4.transactions.create([{ paid: false, amount: 7500, currency: "usd", refunded: true }])
customer4.transactions.create([{ paid: false, amount: 8600, currency: "usd", refunded: true }])

# Disputed transactions
customer1.transactions.create([{ paid: false, amount: 6900, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: false, amount: 2300, currency: "usd", refunded: false }])
customer1.transactions.create([{ paid: false, amount: 5400, currency: "usd", refunded: false }])
customer2.transactions.create([{ paid: false, amount: 5300, currency: "usd", refunded: false }])
customer2.transactions.create([{ paid: false, amount: 3400, currency: "usd", refunded: false }])

