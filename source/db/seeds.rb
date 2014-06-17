# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customers = Customer.create([{ first_name: 'Johny', last_name: 'Flow' }, { first_name: 'Raj', last_name: 'Jamnis' },
                             { first_name: 'Andrew', last_name: 'Chung' }, { first_name: 'Mike', last_name: 'Smith' }])

def random_amount
  rand(1000) * 100
end

5.times  { Charge.create(paid: true, amount: random_amount, customer: customers[0]) }
3.times  { Charge.create(paid: true, amount: random_amount, customer: customers[1]) }
1.times  { Charge.create(paid: true, amount: random_amount, customer: customers[2]) }
1.times  { Charge.create(paid: true, amount: random_amount, customer: customers[3]) }

3.times  { Charge.create(paid: false, amount: random_amount, customer: customers[2]) }
2.times  { Charge.create(paid: false, amount: random_amount, customer: customers[3]) }

3.times  { Charge.create(paid: true, refunded: true, amount: random_amount, customer: customers[0]) }
2.times  { Charge.create(paid: true, refunded: true, amount: random_amount, customer: customers[1]) }