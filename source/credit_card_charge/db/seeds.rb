# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_failed_transactions(transaction_count, customer)
  transaction_count.times do
    Charge.create(
      created: Time.zone.now.to_i,
      amount: rand(100..10_000),
      paid: false,
      refunded: true,
      customer: customer
    )
  end
end

def create_disputed_transactions(transaction_count, customer)
  transaction_count.times do
    Charge.create(
      created: Time.zone.now.to_i,
      amount: rand(100..10_000),
      paid: false,
      refunded: false,
      customer: customer
    )
  end
end

def create_successful_transactions(transaction_count, customer)
  transaction_count.times do
    Charge.create(
      created: Time.zone.now.to_i,
      amount: rand(100..10_000),
      paid: true,
      refunded: false,
      customer: customer
    )
  end
end

customer1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

create_successful_transactions 5, customer1
create_successful_transactions 3, customer2
create_successful_transactions 1, customer3
create_successful_transactions 1, customer4

create_failed_transactions 3, customer3
create_failed_transactions 2, customer4

create_disputed_transactions 3, customer1
create_disputed_transactions 2, customer2
