puts "*** Cleaning Up DB ***"
Customer.destroy_all
Charge.destroy_all

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
create_charge(:successful, customer1, 5)
create_charge(:successful, customer2, 3)
create_charge(:successful, customer3, 1)
create_charge(:successful, customer4, 1)

# Failed charges
create_charge(:failed, customer3, 3)
create_charge(:failed, customer4, 2)

# Disputed charges
create_charge(:disputed, customer1, 3)
create_charge(:disputed, customer2, 2)

puts "*** Finished Seeding ***"