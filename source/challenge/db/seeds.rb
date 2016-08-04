customer1 = Customer.create first_name: 'Johny', last_name: 'Flow'
customer2 = Customer.create first_name: 'Raj', last_name: 'Jamnis'
customer3 = Customer.create first_name: 'Andrew', last_name: 'Chung'
customer4 = Customer.create first_name: 'Mike', last_name: 'Smith'

# successful charges
5.times do
  customer1.charges.create paid: true, refunded: false, amount: rand(1..5000), currency: 'usd'
end

3.times do
  customer2.charges.create paid: true, refunded: false, amount: rand(1..5000), currency: 'usd'
end

customer3.charges.create paid: true, refunded: false, amount: rand(1..5000), currency: 'usd'
customer4.charges.create paid: true, refunded: false, amount: rand(1..5000), currency: 'usd'

# failed charges
3.times do
  customer3.charges.create paid: false, amount: rand(1..5000), currency: 'usd'
end

2.times do
  customer4.charges.create paid: false, amount: rand(1..5000), currency: 'usd'
end

# disputed charges
3.times do
  customer1.charges.create refunded: true, amount: rand(1..5000), currency: 'usd'
end

2.times do
  customer2.charges.create refunded: true, amount: rand(1..5000), currency: 'usd'
end