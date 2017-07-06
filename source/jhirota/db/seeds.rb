# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.destroy_all
customers = [
  {first_name: 'Johny', last_name: 'Flow'},
  {first_name: 'Raj', last_name: 'Jamnis'},
  {first_name: 'Andrew', last_name: 'Chung'},
  {first_name: 'Mike', last_name: 'Smith'}
]
p '>>>>>>> Creating customers'
customers.each do |customer|
  Customer.create!(first_name: customer[:first_name], last_name: customer[:last_name])
end

p '>>>>>>> Creating transactions'
customer  = Customer.all[0]
5.times.each do
  customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
end
3.times.each do
  customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: true)
end

customer  = Customer.all[1]
3.times.each do
  customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
end
2.times.each do
  customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: true)
end

customer  = Customer.all[2]
customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
3.times.each do
  customer.charges.create( paid: false, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
end

customer  = Customer.all[3]
customer.charges.create( paid: true, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
2.times.each do
  customer.charges.create( paid: false, amount: Random.rand(10) * 1000 + 900, currency: "usd", refunded: false)
end
p '>>>>>>> end <<<<<<<<'
