# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# create customers
puts 'Creating customers...'
c1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
c2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
c3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
c4 = Customer.create(first_name: 'Mike', last_name: 'Smith')
puts "\tDone"

puts 'Creating transactions...'
# successful
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c2.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c2.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c2.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c3.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c4.id, paid: true, refunded: false, amount: Random.new.rand(1000..100000))

# failed
CreditCardCharge.create(customer_id: c3.id, paid: false, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c3.id, paid: false, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c3.id, paid: false, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c4.id, paid: false, refunded: false, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c4.id, paid: false, refunded: false, amount: Random.new.rand(1000..100000))

# disputed
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: true, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: true, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c1.id, paid: true, refunded: true, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c2.id, paid: true, refunded: true, amount: Random.new.rand(1000..100000))
CreditCardCharge.create(customer_id: c2.id, paid: true, refunded: true, amount: Random.new.rand(1000..100000))
puts "\tDone"
