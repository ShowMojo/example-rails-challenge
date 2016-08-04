# clear database
Customer.destroy_all
Charge.destroy_all

# create four customers
customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# 10 successful charges
5.times do
  customer1.charges.successful.create!(amount: rand(0..100000), currency: 'usd')
end
3.times do
  customer2.charges.successful.create!(amount: rand(0..100000), currency: 'usd')
end
customer3.charges.successful.create!(amount: rand(0..100000), currency: 'usd')
customer4.charges.successful.create!(amount: rand(0..100000), currency: 'usd')

# 5 charges that failed
3.times do
  customer3.charges.failed.create!(amount: rand(0..100000), currency: 'usd')
end
2.times do
  customer4.charges.failed.create!(amount: rand(0..100000), currency: 'usd')
end

# 5 disputed charges
3.times do
  customer1.charges.disputed.create!(amount: rand(0..100000), currency: 'usd')
end
2.times do
  customer2.charges.disputed.create!(amount: rand(0..100000), currency: 'usd')
end