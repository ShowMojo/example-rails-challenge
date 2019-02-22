# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
customers = []

['Johny Flow', 'Raj Jamnis', 'Andrew Chung', 'Mike Smith'].each_with_index do |customer, i|
  c = customer.split(' ')
  customers << Customer.find_or_create_by(first_name: c.first, last_name: c.second)
end

CardCharge.destroy_all

# Succesful transactions
5.times { customers.first.card_charges.create(paid: true, amount: rand(10000)) }
3.times { customers.second.card_charges.create(paid: true, amount: rand(10000)) }
customers.third.card_charges.create(paid: true, amount: rand(10000))
customers.fourth.card_charges.create(paid: true, amount: rand(10000))

# Failed transactions
3.times { customers.third.card_charges.create(paid: false, amount: rand(10000)) }
2.times { customers.fourth.card_charges.create(paid: false, amount: rand(10000)) }

# Disputed transactions
3.times { customers.first.card_charges.create(paid: true, amount: rand(10000), disputed_at: 10.minutes.ago) }
2.times { customers.second.card_charges.create(paid: true, amount: rand(10000), disputed_at: 10.minutes.ago) }
