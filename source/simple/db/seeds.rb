customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# successful charges
5.times do
  Charge.create!(paid: true, refunded: false, amount: rand(500000), customer: customer1, currency: 'usd')
end
3.times do
  Charge.create!(paid: true, refunded: false, amount: rand(500000), customer: customer2, currency: 'usd')
end
Charge.create!(paid: true, refunded: false, amount: rand(500000), customer: customer3, currency: 'usd')
Charge.create!(paid: true, refunded: false, amount: rand(500000), customer: customer4, currency: 'usd')

# failed charges
3.times do
  Charge.create!(paid: false, amount: rand(500000), customer: customer3, currency: 'usd')
end
2.times do
  Charge.create!(paid: false, amount: rand(500000), customer: customer4, currency: 'usd')
end

# disputed charges
3.times do
  Charge.create!(refunded: true, amount: rand(500000), customer: customer1, currency: 'usd')
end
2.times do
  Charge.create!(refunded: true, amount: rand(500000), customer: customer2, currency: 'usd')
end
