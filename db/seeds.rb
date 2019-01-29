# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Charge.delete_all
Customer.delete_all

# Customers
customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# Successful Charges
5.times { Charge.create!(paid: true, amount: rand(2000), currency: 'usd', refunded: false, customer: customer1) }
3.times { Charge.create!(paid: true, amount: rand(2000), currency: 'usd', refunded: false, customer: customer2) }
Charge.create!(paid: true, amount: rand(2000), currency: 'usd', refunded: false, customer: customer3)
Charge.create!(paid: true, amount: rand(2000), currency: 'usd', refunded: false, customer: customer4)

# Failed Charges
3.times { Charge.create!(paid: false, amount: rand(2000), currency: 'usd', refunded: false, customer: customer3) }
2.times { Charge.create!(paid: false, amount: rand(2000), currency: 'usd', refunded: false, customer: customer4) }

# Disputed Charges
3.times { Charge.create!(paid: false, amount: rand(2000), currency: 'usd', refunded: true, customer: customer1) }
2.times { Charge.create!(paid: false, amount: rand(2000), currency: 'usd', refunded: true, customer: customer2) }
