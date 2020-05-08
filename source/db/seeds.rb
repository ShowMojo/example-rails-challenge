# Customers
customer_1 = Customer.create!(first_name: 'Alex', last_name: 'Winter')
customer_2 = Customer.create!(first_name: 'Andy', last_name: 'Summer')
customer_3 = Customer.create!(first_name: 'Greg', last_name: 'Shu')
customer_4 = Customer.create!(first_name: 'Donald', last_name: 'Maclein')

# Successful charges
5.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_1.id
  )
end

3.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_2.id
  )
end

Charge.create!(
  paid: true,
  amount: 4900,
  currency: 'usd',
  refunded: false,
  customer_id: customer_3.id
)

Charge.create!(
  paid: true,
  amount: 4900,
  currency: 'usd',
  refunded: false,
  customer_id: customer_4.id
)

# Failed charges
3.times do
  Charge.create!(
    paid: false,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_3.id
  )
end

2.times do
  Charge.create!(
    paid: false,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_4.id
  )
end

# Disputed charges
3.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: true,
    customer_id: customer_1.id
  )
end

2.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: true,
    customer_id: customer_2.id
  )
end
