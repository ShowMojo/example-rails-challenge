customers = [
  { firstname: 'Johny', lastname: 'Flow' },
  { firstname: 'Raj', lastname: 'Jamnis' },
  { firstname: 'Andrew', lastname: 'Chung' },
  { firstname: 'Mike', lastname: 'Smith' }
]

customers.each do |customer|
  c = Customer.create!(firstname: customer[:firstname], lastname: customer[:lastname])

  puts "\nCustomer #{c.id}:"
  puts "First Name: #{c.firstname}"
  puts "Last Name: #{c.lastname}"
end

# Seed 20 transactions (charges) into the system:
# 10 Should be successful transactions:
CardCharge.create(paid: true, amount_cents: 10000, refunded: false, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 20000, refunded: false, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 30000, refunded: false, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 40000, refunded: false, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 50000, refunded: false, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 10000, refunded: false, customer_id: 2)
CardCharge.create(paid: true, amount_cents: 20000, refunded: false, customer_id: 2)
CardCharge.create(paid: true, amount_cents: 30000, refunded: false, customer_id: 2)
CardCharge.create(paid: true, amount_cents: 40000, refunded: false, customer_id: 3)
CardCharge.create(paid: true, amount_cents: 50000, refunded: false, customer_id: 4)

# 5 Should be transactions that failed:
CardCharge.create(paid: false, amount_cents: 45000, refunded: false, customer_id: 3)
CardCharge.create(paid: false, amount_cents: 35000, refunded: false, customer_id: 3)
CardCharge.create(paid: false, amount_cents: 30000, refunded: false, customer_id: 3)

CardCharge.create(paid: false, amount_cents: 55000, refunded: false, customer_id: 4)
CardCharge.create(paid: false, amount_cents: 65000, refunded: false, customer_id: 4)

# 5 should be disputed:
CardCharge.create(paid: true, amount_cents: 10000, refunded: true, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 20000, refunded: true, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 30000, refunded: true, customer_id: 1)
CardCharge.create(paid: true, amount_cents: 10000, refunded: true, customer_id: 2)
CardCharge.create(paid: true, amount_cents: 20000, refunded: true, customer_id: 2)
