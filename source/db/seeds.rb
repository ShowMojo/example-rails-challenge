# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# successful transactions
customer1 = Customer.create(first_name:'Johny', last_name:'Flow')
customer2 = Customer.create(first_name:'Raj', last_name:'Jamnis')
customer3 = Customer.create(first_name:'Andrew', last_name:'Chung')
customer4 = Customer.create(first_name:'Mike', last_name:'Smith')

CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer1)
CreditCardCharge.create(paid:true, amount:4500.00, currency:'USD', refunded:true, customer:customer1)
CreditCardCharge.create(paid:true, amount:5500.00, currency:'USD', refunded:true, customer:customer1)
CreditCardCharge.create(paid:true, amount:6500.00, currency:'USD', refunded:true, customer:customer1)
CreditCardCharge.create(paid:true, amount:7500.00, currency:'USD', refunded:true, customer:customer1)
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer2)
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer2)
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer2)
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer3)
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:true, customer:customer4)

# failed transactions
CreditCardCharge.create(paid:false, amount:3500.00, currency:'USD', refunded:false, customer:customer3)
CreditCardCharge.create(paid:false, amount:4500.00, currency:'USD', refunded:false, customer:customer3)
CreditCardCharge.create(paid:false, amount:5500.00, currency:'USD', refunded:false, customer:customer3)
CreditCardCharge.create(paid:false, amount:6500.00, currency:'USD', refunded:false, customer:customer4)
CreditCardCharge.create(paid:false, amount:7500.00, currency:'USD', refunded:false, customer:customer4)

# disputed transactions
CreditCardCharge.create(paid:true, amount:3500.00, currency:'USD', refunded:false, customer:customer1)
CreditCardCharge.create(paid:true, amount:4500.00, currency:'USD', refunded:false, customer:customer1)
CreditCardCharge.create(paid:true, amount:5500.00, currency:'USD', refunded:false, customer:customer1)
CreditCardCharge.create(paid:true, amount:6500.00, currency:'USD', refunded:false, customer:customer2)
CreditCardCharge.create(paid:true, amount:7500.00, currency:'USD', refunded:false, customer:customer2)
