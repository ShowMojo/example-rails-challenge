# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create customers
[
  %w(Johny Flow),
  %w(Raj Jamnis),
  %w(Andrew Chung),
  %w(Mike Smith)
].each do |customer|
  Customer.create! first_name: customer.first, last_name: customer.last
end

def create_charge_for customer_id, paid, refunded
  Customer.find(customer_id).charges.create!(
    created: Time.new,
    paid: paid,
    amount: rand(1..1000_000) / 100.0,
    currency: 'usd',
    refunded: refunded
  )
end

# Create 10 successful transactions
5.times { create_charge_for 1, true, false }
3.times { create_charge_for 2, true, false }
create_charge_for 3, true, false
create_charge_for 4, true, false


# Create 5 failed transactions
3.times { create_charge_for 3, true, true }
2.times { create_charge_for 4, true, true }

# Create 5 disputed transactions
3.times { create_charge_for 1, false, true }
2.times { create_charge_for 2, false, true }


