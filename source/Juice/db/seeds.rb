# customers
customer_1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# successful transactions
params = {
  paid: true,
  refunded: false
}

5.times do
  customer_1.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end

3.times do
  customer_2.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end

customer_3.charges.create!(params.merge(
  amount: Faker::Number.number(digits: 5)
))

customer_4.charges.create!(params.merge(
  amount: Faker::Number.number(digits: 5)
))

# failed transactions
params = {
  paid: false,
  refunded: false
}

3.times do
  customer_3.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end

2.times do
  customer_4.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end

# disputed transactions
params = {
  paid: true,
  refunded: true
}

3.times do
  customer_1.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end

2.times do
  customer_2.charges.create!(params.merge(
    amount: Faker::Number.number(digits: 5)
  ))
end
