# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

# successful

5.times { customer1.charges.create(paid: true, amount: Random.rand(100000)) }
3.times { customer2.charges.create(paid: true, amount: Random.rand(100000)) }
customer3.charges.create(paid: true, amount: Random.rand(100000))
customer4.charges.create(paid: true, amount: Random.rand(100000))

# failed

3.times { customer3.charges.create(paid: false, amount: Random.rand(100000)) }
2.times { customer4.charges.create(paid: false, amount: Random.rand(100000)) }

# disputed

3.times { customer1.charges.create(paid: true, refunded: true, amount: Random.rand(100000)) }
2.times { customer2.charges.create(paid: true, refunded: true, amount: Random.rand(100000)) }