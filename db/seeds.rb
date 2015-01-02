customer_1 = Customer.create first_name: 'Johny', last_name: 'Flow'
customer_2 = Customer.create first_name: 'Raj', last_name: 'Jamnis'
customer_3 = Customer.create first_name: 'Andrew', last_name: 'Chung'
customer_4 = Customer.create first_name: 'Mike', last_name: 'Smith'

puts 'Seed successful charges ...'
# Customer 1
(1..5).each do
  Charge.create(
    created: Time.now.to_f * 1000,
    paid: true,
    amount: (1000.0 - 5.0) * rand() + 5,
    currency: 'usd',
    refunded: false,
    customer: customer_1
  )
end

# Customer 2
(1..3).each do
  Charge.create(
    created: Time.now.to_f * 1000,
    paid: true,
    amount: (1000.0 - 5.0) * rand() + 5,
    currency: 'usd',
    refunded: false,
    customer: customer_2
  )
end

# Customer 3
Charge.create(
  created: Time.now.to_f * 1000,
  paid: true,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: false,
  customer: customer_3
)

# Customer 4
Charge.create(
  created: Time.now.to_f * 1000,
  paid: true,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: false,
  customer: customer_4
)

puts 'Done!'

puts 'Seed failed charges ...'

# Customer 3
(1..3).each do
  Charge.create(
  created: Time.now.to_f * 1000,
  paid: false,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: false,
  customer: customer_3
  )
end

# Customer 4
(1..2).each do
  Charge.create(
  created: Time.now.to_f * 1000,
  paid: false,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: false,
  customer: customer_4
  )
end

puts 'Done!'

puts 'Seed disputed chages'

# Customer 1
(1..3).each do
  Charge.create(
  created: Time.now.to_f * 1000,
  paid: true,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: true,
  customer: customer_1
  )
end

# Customer 2
(1..2).each do
  Charge.create(
  created: Time.now.to_f * 1000,
  paid: true,
  amount: (1000.0 - 5.0) * rand() + 5,
  currency: 'usd',
  refunded: true,
  customer: customer_2
  )
end

puts 'Done!'

puts 'Finish'
