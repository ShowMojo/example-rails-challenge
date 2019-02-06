# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts "*** Seeding Customers ***"
customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create!(first_name: 'Ra', last_name: 'Jamnis')
customer3 = Customer.create!(first_name: 'Andre', last_name: 'Chung')
customer4 = Customer.create!(first_name: 'Mik', last_name: 'Smith')

puts "*** Seeding Charges ***"

def create_charge(status, customer, count)
  puts "\t Creating #{count} #{status} Charges for Customer #{customer.id}"

  count.times do
    Charge.send(status).create(
      customer_id: customer.id,
      amount: rand(100..99999),
      currency: 'usd',
      created_at: rand(2.years).seconds.ago
    )
  end
end

# Succeffull charges
create_charge(:successfull, customer1, 5)
create_charge(:successfull, customer2, 3)
create_charge(:successfull, customer3, 1)
create_charge(:successfull, customer4, 1)

# Failed charges
create_charge(:failed, customer3, 3)
create_charge(:failed, customer4, 2)

# Disputed charges
create_charge(:disputed, customer1, 3)
create_charge(:disputed, customer2, 2)

puts "*** Finished Seeding ***"