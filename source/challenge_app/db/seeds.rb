# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def get_amount
  Random.new.rand(10_000) / 100.0
end

def create_charges(count, customer, params)
  count.times {customer.charges.create!(params.merge(amount: get_amount))}
end

names = [
    ['Johny', 'Flow'],
    ['Raj', 'Jamnis'],
    ['Andrew', 'Chung'],
    ['Mike', 'Smith']
]

names.each do |name|
  Customer.create!(first_name: name[0], last_name: name[1])
end

customer1 = Customer.first
customer2 = Customer.second
customer3 = Customer.third
customer4 = Customer.fourth

#successful
sucessful_params = {paid: true, refunded: false}
create_charges(5, customer1, sucessful_params)
create_charges(3, customer2, sucessful_params)
create_charges(1, customer3, sucessful_params)
create_charges(1, customer4, sucessful_params)

#failed
failed_params = {paid: false}
create_charges(3, customer3, failed_params)
create_charges(2, customer4, failed_params)

#disputed
disputed_params = {paid: true, refunded: true}
create_charges(3, customer1, disputed_params)
create_charges(2, customer2, disputed_params)
