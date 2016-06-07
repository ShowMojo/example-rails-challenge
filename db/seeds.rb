# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

customer_1 = Customer.create(:first_name => 'Johny', :last_name => 'Flow')
customer_2 = Customer.create(:first_name => 'Raj', :last_name => 'Jamnis')
customer_3 = Customer.create(:first_name => 'Andrew', :last_name => 'Chung')
customer_4 = Customer.create(:first_name => 'Mike', :last_name => 'Smith')

(1..5).each do
  Creaditcharge.create(:customer => customer_1, paid: true, refunded: false, amount: 120, currency: 'usd')
end

(1..3).each do
  Creaditcharge.create(:customer => customer_2, paid: true, refunded: false, amount: 500, currency: 'usd')
end

  Creaditcharge.create(:customer => customer_3, paid: true, refunded: false, amount: 1000, currency: 'usd')
  Creaditcharge.create(:customer => customer_4, paid: true, refunded: false, amount: 1500, currency: 'usd')

(1..3).each do
  Creaditcharge.create(:customer => customer_1, paid: true, refunded: true, amount: 500, currency: 'usd')
end

(1..2).each do
  Creaditcharge.create(:customer => customer_2, paid: true, refunded: true, amount: 1500, currency: 'usd')
end

(1..3).each do
  Creaditcharge.create(:customer => customer_3, paid: false, refunded: false, amount: 2500, currency: 'usd')
end

(1..2).each do
  Creaditcharge.create(:customer => customer_4, paid: false, refunded: false, amount: 3500, currency: 'usd')
end