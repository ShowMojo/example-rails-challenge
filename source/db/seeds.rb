# frozen_string_literal: true

# This file should contain all the record creation needed to
# seed the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).

customer1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
customer2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
customer3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
customer4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

# rubocop:disable Layout/LineLength
# Successful
5.times do |i|
  customer1.charges.successful.create!(amount: rand.to_s[2..6],
                                       currency: Charge.currencies['usd'],
                                       created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end

3.times do |i|
  customer2.charges.successful.create!(amount: rand.to_s[2..6],
                                       currency: Charge.currencies['usd'],
                                       created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end

customer3.charges.successful.create!(amount: rand.to_s[2..6],
                                     currency: Charge.currencies['usd'],
                                     created_at: Time.zone.now - 5.days + rand(100).minutes)
customer4.charges.successful.create!(amount: rand.to_s[2..6],
                                     currency: Charge.currencies['usd'],
                                     created_at: Time.zone.now - 4.days + rand(100).minutes)

# Failed
3.times do |i|
  customer3.charges.failed.create!(amount: rand.to_s[2..6],
                                   currency: Charge.currencies['usd'],
                                   created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end

2.times do |i|
  customer4.charges.failed.create!(amount: rand.to_s[2..6],
                                   currency: Charge.currencies['usd'],
                                   created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end

# Disputed
3.times do |i|
  customer1.charges.disputed.create!(amount: rand.to_s[2..6],
                                     currency: Charge.currencies['usd'],
                                     created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end

2.times do |i|
  customer1.charges.disputed.create!(amount: rand.to_s[2..6],
                                     currency: Charge.currencies['usd'],
                                     created_at: Time.zone.now - (10 - i).days + rand(100).minutes)
end
# rubocop:enable Layout/LineLength
