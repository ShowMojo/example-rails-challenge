# create customers
customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')


# create charges
# 10 successful transactions:
(1..5).each do |t|
  Charge.create(
    customer: customer_1,
    currency: 'usd',
    paid: true,
    refunded: false,
    amount: rand(10..100) * 100
  )
end

(1..3).each do |t|
  Charge.create(
    customer: customer_2,
    currency: 'usd',
    paid: true,
    refunded: false,
    amount: rand(10..100) * 100
  )
end

Charge.create(
  customer: customer_3,
  currency: 'usd',
  paid: true,
  refunded: false,
  amount: rand(10..100) * 100
)

Charge.create(
  customer: customer_4,
  currency: 'usd',
  paid: true,
  refunded: false,
  amount: rand(10..100) * 100
)

# 5 unsuccessful transaction
(1..3).each do |t|
  Charge.create(
    customer: customer_3,
    currency: 'usd',
    paid: false,
    refunded: false,
    amount: rand(10..100) * 100
  )
end

(1..2).each do |t|
  Charge.create(
    customer: customer_4,
    currency: 'usd',
    paid: false,
    refunded: false,
    amount: rand(10..100) * 100
  )
end

# 5 disputed transactions
(1..3).each do |t|
  Charge.create(
    customer: customer_1,
    currency: 'usd',
    paid: true,
    refunded: true,
    amount: rand(10..100) * 100
  )
end

(1..2).each do |t|
  Charge.create(
    customer: customer_2,
    currency: 'usd',
    paid: true,
    refunded: true,
    amount: rand(10..100) * 100
  )
end