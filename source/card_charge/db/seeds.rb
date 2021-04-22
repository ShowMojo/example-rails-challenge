# customers ##
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
  }
]

customers = customers.map do |cus|
  Customer.create(cus)
end

# transactions ##
# success
charge = {
  currency: 'usd',
  refunded: false,
  created: Time.current.to_i
}

paid_charge = charge.merge({
  amount: rand(1000),
  paid: true
})

5.times do
  customers[0].charges.create(paid_charge)
end

3.times do
  customers[1].charges.create(paid_charge)
end

customers[2].charges.create(paid_charge)
customers[3].charges.create(paid_charge)

# failed
failed_charge = charge.merge({
  amount: rand(1000),
  paid: false
})
3.times do
  customers[2].charges.create(failed_charge)
end

2.times do
  customers[3].charges.create(failed_charge)
end

# disputed
disputed_charge = charge.merge({
  amount: rand(1000),
  paid: true,
  refunded: true,
  refunded_at: rand(40).day.ago
})
3.times do
  customers[0].charges.create(disputed_charge)
end

2.times do
  customers[1].charges.create(disputed_charge)
end