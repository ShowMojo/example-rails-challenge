# run "rake db:reset" to purge data and re-seed

# The following comments are redundant, just to show they are following the test

puts 'Seed 4 Customers into the system:'

# Customer 1:
#   First Name: Johny
#   Last Name: Flow
customer1 = Fabricate(:customer, first_name: 'Johny', last_name: 'Flow')

# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis
customer2 = Fabricate(:customer, first_name: 'Raj', last_name: 'Jamnis')

# Customer 3:
#   First Name: Andrew
#   Last Name: Chung
customer3 = Fabricate(:customer, first_name: 'Andrew', last_name: 'Chung')

# Customer 4:
#   First Name: Mike
#   Last Name: Smith
customer4 = Fabricate(:customer, first_name: 'Mike', last_name: 'Smith')

puts 'Seed 20 transactions (charges) into the system:'

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
5.times do
  Fabricate(:charge, customer: customer1, paid: true, refunded: false)
end

#   - 3 Should be linked to Customer 2
3.times do
  Fabricate(:charge, customer: customer2, paid: true, refunded: false)
end
#   - 1 Should be linked to Customer 3
Fabricate(:charge, customer: customer3, paid: true, refunded: false)
#   - 1 Should be linked to Customer 4
Fabricate(:charge, customer: customer4, paid: true, refunded: false)

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
3.times do
  Fabricate(:charge, customer: customer3, paid: false)
end
#   - 2 Should be linked to Customer 4
2.times do
  Fabricate(:charge, customer: customer4, paid: false)
end

# 5 should be disputed:
#   - 3 should be linked to Customer 1
3.times do
  Fabricate(:charge, customer: customer1, paid: true, refunded: true)
end
#   - 2 should be linked to customer 2
2.times do
  Fabricate(:charge, customer: customer2, paid: true, refunded: true)
end
