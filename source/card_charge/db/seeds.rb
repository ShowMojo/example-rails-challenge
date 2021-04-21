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
success_charge = {
  paid: true,
  amount: rand(1000),
  currency: 'usd',
  refunded: false,
  created: Time.current.to_i
}

5.times do
  customers[0].charges.create(success_charge)
end

3.times do
  customers[1].charges.create(success_charge)
end

customers[2].charges.create(success_charge)
customers[3].charges.create(success_charge)

# failed
3.times do
  customers[2].charges.create(success_charge.merge!(paid: false))
end

2.times do
  customers[3].charges.create(success_charge.merge!(paid: false))
end

# disputed
3.times do
  customers[0].charges.create(success_charge.merge!(refunded: true))
end

2.times do
  customers[1].charges.create(success_charge.merge!(refunded: true))
end