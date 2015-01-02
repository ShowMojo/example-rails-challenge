# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeding DB with data'

customers_ids = []
customers = [["Johny", "Flow"], ["Raj", "Jamins"], ["Andrew", "Chung"], ["Mike", "Smith"]]

customers.each do |c| 
  customers_ids << Customer.create(firstname: c[0], lastname: c[1]).id
end

def create_transaction(state, customer_id, times = 1)
  attrs = {}
  attrs[:customer_id] = customer_id

  if state == 'succeed'
    attrs[:paid] = true
    attrs[:refunded] = false
  elsif state == 'failed'
    attrs[:paid] = false
    attrs[:refunded] = true
  else
    attrs[:paid] = false
    attrs[:refunded] = false
  end

  times.times do
    Charge.create attrs
  end
end

create_transaction('succeed', customers_ids[0], 5)
create_transaction('succeed', customers_ids[1], 3)
create_transaction('succeed', customers_ids[2], 1)
create_transaction('succeed', customers_ids[3], 1)

create_transaction('failed', customers_ids[2], 3)
create_transaction('failed', customers_ids[3], 2)

create_transaction('disputed', customers_ids[0], 3)
create_transaction('disputed', customers_ids[1], 2)
