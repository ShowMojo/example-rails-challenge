customer = Customer.create!(first_name: 'Adam', last_name: 'Sandler')
customer1 = Customer.create!(first_name: 'Adam2', last_name: 'Sandler2')
customer2 = Customer.create!(first_name: 'Adam3', last_name: 'Sandler3')
customer3 = Customer.create!(first_name: 'Adam4', last_name: 'Sandler4')

10.times do |n|
  created = rand(10560) + n
  amount = rand(10560) + n
  Charge.create!(created: created, amount: amount, paid: true, currency: 'USD', refunded: false, customer_id: customer.id)
end

5.times do |n|
  created = rand(10560) + n
  amount = rand(10560) + n
  Charge.create!(created: created, amount: amount, paid: false, currency: 'USD', refunded: false, customer_id: customer.id)
end

5.times do |n|
  created = rand(10560) + n
  amount = rand(10560) + n
  Charge.create!(created: created, amount: amount, paid: true, currency: 'USD', refunded: true, customer_id: customer.id)
end