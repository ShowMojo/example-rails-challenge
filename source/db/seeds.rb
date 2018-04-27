random = (1..10000).to_a

customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

5.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_1,
    currency: 'usd',
    paid: true,
    refunded: false
  )
end

3.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_2,
    currency: 'usd',
    paid: true,
    refunded: false
  )
end

CreditCardCharge.create(
  amount: random.sample,
  customer: customer_3,
  currency: 'usd',
  paid: true,
  refunded: false
)

CreditCardCharge.create(
  amount: random.sample,
  customer: customer_4,
  currency: 'usd',
  paid: true,
  refunded: false
)

3.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_3,
    currency: 'usd',
    paid: false,
    refunded: false
  )
end

2.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_4,
    currency: 'usd',
    paid: false,
    refunded: false
  )
end

3.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_1,
    currency: 'usd',
    paid: true,
    refunded: true
  )
end

2.times do
  CreditCardCharge.create(
    amount: random.sample,
    customer: customer_2,
    currency: 'usd',
    paid: true,
    refunded: true
  )
end
