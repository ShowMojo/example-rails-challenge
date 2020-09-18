customers = [
  {
    first_name: 'Johny',
    last_name: 'Flow'
  },
  {
    first_name: 'Raj',
    last_name: 'Jamnis'
  },
  {
    first_name: 'Andrew',
    last_name: 'Chung'
  },
  {
    first_name: 'Mike',
    last_name: 'Smith'
  },
]
customers.each do |customer|
  Customer.where(customer).first_or_create
end
customer_1 = Customer.find(1)
customer_2 = Customer.find(2)
customer_3 = Customer.find(3)
customer_4 = Customer.find(4)
5.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_1.id,
    status: 'success'
  )
end
3.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_2.id,
    status: 'success'
  )
end
Charge.create!(
  paid: true,
  amount: 4900,
  currency: 'usd',
  refunded: false,
  customer_id: customer_3.id,
  status: 'success'
)
Charge.create!(
  paid: true,
  amount: 4900,
  currency: 'usd',
  refunded: false,
  customer_id: customer_4.id,
  status: 'success'
)
3.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_3.id,
    status: 'failed'
  )
end
2.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_4.id,
    status: 'failed'
  )
end
3.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_1.id,
    status: 'disputed'
  )
end
2.times do
  Charge.create!(
    paid: true,
    amount: 4900,
    currency: 'usd',
    refunded: false,
    customer_id: customer_2.id,
    status: 'disputed'
  )
end
