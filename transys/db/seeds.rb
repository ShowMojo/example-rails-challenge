# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(first_name: 'Johny', last_name: 'Flow')
Customer.create(first_name: 'Raj', last_name: 'Jamnis')
Customer.create(first_name: 'Andrew', last_name: 'Chung')
Customer.create(first_name: 'Mike', last_name: 'Smith')

C2charge.create(paid:true, amount:4900, currency: "usd", refunded: false, customer_id: 1, status: 1) #transaction success
C2charge.create(paid:true, amount:4800, currency: "usd", refunded: false, customer_id: 1, status: 1) #transaction success
C2charge.create(paid:true, amount:4700, currency: "usd", refunded: false, customer_id: 1, status: 1) #transaction success
C2charge.create(paid:true, amount:4600, currency: "usd", refunded: false, customer_id: 1, status: 1) #transaction success
C2charge.create(paid:true, amount:4500, currency: "usd", refunded: false, customer_id: 1, status: 1) #transaction success

C2charge.create(paid:true, amount:4700, currency: "usd", refunded: false, customer_id: 2, status: 1) #transaction success
C2charge.create(paid:true, amount:4600, currency: "usd", refunded: false, customer_id: 2, status: 1) #transaction success
C2charge.create(paid:true, amount:4500, currency: "usd", refunded: false, customer_id: 2, status: 1) #transaction success

C2charge.create(paid:true, amount:4600, currency: "usd", refunded: false, customer_id: 3, status: 1) #transaction success
C2charge.create(paid:true, amount:4500, currency: "usd", refunded: false, customer_id: 4, status: 1) #transaction success

C2charge.create(paid:false, amount:4900, currency: "usd", refunded: false, customer_id: 3, status: 0) #transaction failed
C2charge.create(paid:false, amount:4800, currency: "usd", refunded: false, customer_id: 3, status: 0) #transaction failed
C2charge.create(paid:false, amount:4700, currency: "usd", refunded: false, customer_id: 3, status: 0) #transaction failed
C2charge.create(paid:false, amount:4600, currency: "usd", refunded: false, customer_id: 4, status: 0) #transaction failed
C2charge.create(paid:false, amount:4500, currency: "usd", refunded: false, customer_id: 4, status: 0) #transaction failed

C2charge.create(paid:true, amount:4900, currency: "usd", refunded: false, customer_id: 1, status: -1) #transaction disputed
C2charge.create(paid:true, amount:4800, currency: "usd", refunded: false, customer_id: 1, status: -1) #transaction disputed
C2charge.create(paid:true, amount:4700, currency: "usd", refunded: false, customer_id: 1, status: -1) #transaction disputed
C2charge.create(paid:true, amount:4600, currency: "usd", refunded: false, customer_id: 2, status: -1) #transaction disputed
C2charge.create(paid:true, amount:4500, currency: "usd", refunded: false, customer_id: 2, status: -1) #transaction disputed