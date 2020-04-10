Customer.delete_all

customer_1 = Customer.create(
  first_name: 'Johny',
  last_name: 'Flow'
)

customer_2 = Customer.create(
  first_name: 'Raj',
  last_name: 'Jamnis'
)

customer_3 = Customer.create(
  first_name: 'Andrew',
  last_name: 'Chung'
)

customer_4 = Customer.create(
  first_name: 'Mike',
  last_name: 'Smith'
)


5.times do
  Charge.create(
    paid: true,
    amount: 10000,
    currency: 'usd',
    refunded: false,
    customer: customer_1
  )
end

3.times do
  Charge.create(
    paid: true,
    amount: 10000,
    currency: 'usd',
    refunded: false,
    customer: customer_2
  )
end

Charge.create(
  paid: true,
  amount: 10000,
  currency: 'usd',
  refunded: false,
  customer: customer_3
)

Charge.create(
  paid: true,
  amount: 10000,
  currency: 'usd',
  refunded: false,
  customer: customer_4
)

3.times do
  Charge.create(
    paid: false,
    amount: 10000,
    currency: 'usd',
    refunded: false,
    customer: customer_3
  )
end

2.times do
  Charge.create(
    paid: false,
    amount: 10000,
    currency: 'usd',
    refunded: false,
    customer: customer_4
  )
end

3.times do
  Charge.create(
    paid: true,
    amount: 10000,
    currency: 'usd',
    refunded: true,
    customer: customer_1
  )
end

2.times do
  Charge.create(
    paid: true,
    amount: 10000,
    currency: 'usd',
    refunded: true,
    customer: customer_2
  )
end
