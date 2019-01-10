puts '*** Seeding customers ***'

customers_attrs = [
  { first_name: 'Johny', last_name: 'Flow' },
  { first_name: 'Raj', last_name: 'Jamnis' },
  { first_name: 'Andrew', last_name: 'Chung' },
  { first_name: 'Mike', last_name: 'Smith' }
]

customers = customers_attrs.map { |attrs| Customer.find_or_create_by!(attrs) }

puts '*** Seeding charges ***'
def assign_random_charges(customer, count, status)
  attrs = Array.new(count) { { amount: rand(100..10_000), status: status } }
  customer.charges.create!(attrs)
end
assign_random_charges(customers[0], 5, :successful)
assign_random_charges(customers[0], 3, :disputed)

assign_random_charges(customers[1], 3, :successful)
assign_random_charges(customers[1], 2, :disputed)

assign_random_charges(customers[2], 1, :successful)
assign_random_charges(customers[2], 3, :failed)

assign_random_charges(customers[3], 1, :successful)
assign_random_charges(customers[3], 2, :failed)
