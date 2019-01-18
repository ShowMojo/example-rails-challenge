cust1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
cust2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
cust3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
cust4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

charge_attributes = {
  created: Time.now,
  currency: 'usd'
}

# 10 successful transactions:
5.times do
  cust1.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: false}))
end

3.times do
  cust2.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: false}))
end

cust3.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: false}))

cust4.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: false}))

# 5 failed transactions:
3.times do
  cust3.charges.create(charge_attributes.merge({paid: false, amount: rand(999999), refunded: false}))
end

2.times do
  cust4.charges.create(charge_attributes.merge({paid: false, amount: rand(999999), refunded: false}))
end

# 5 disputed transactions:
3.times do
  cust1.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: true}))
end

2.times do
  cust2.charges.create(charge_attributes.merge({paid: true, amount: rand(999999), refunded: true}))
end
