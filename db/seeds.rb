# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

(1..5).each do |count|
  CreditCardCharge.create(customer_id: customer_1.id, created: DateTime.now, amount: 100 + count, paid: true, refunded: false, currency: 'usd')
end

(1..3).each do |count|
  CreditCardCharge.create(customer_id: customer_2.id, created: DateTime.now, amount: 100 + count, paid: true, refunded: false, currency: 'usd')
end

CreditCardCharge.create(customer_id: customer_3.id, created: DateTime.now, amount: 100, paid: true, refunded: false, currency: 'usd')
CreditCardCharge.create(customer_id: customer_4.id, created: DateTime.now, amount: 100, paid: true, refunded: false, currency: 'usd')

(1..3).each do |count|
  CreditCardCharge.create(customer_id: customer_3.id, created: DateTime.now, amount: 100 + count, paid: false, refunded: false, currency: 'usd')
end

(1..2).each do |count|
  CreditCardCharge.create(customer_id: customer_4.id, created: DateTime.now, amount: 100 + count, paid: false, refunded: false, currency: 'usd')
end

(1..3).each do |count|
  CreditCardCharge.create(customer_id: customer_1.id, created: DateTime.now, amount: 100 + count, paid: true, refunded: true, currency: 'usd')
end

(1..2).each do |count|
  CreditCardCharge.create(customer_id: customer_2.id, created: DateTime.now, amount: 100 + count, paid: true, refunded: true, currency: 'usd')
end
