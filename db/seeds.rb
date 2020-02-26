# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['Johny Flow', 'Raj Jamnis', 'Andrew Chung', 'Mike Smith'].each do |name|
  first_name, last_name = name.split ' '
  Customer.create first_name: first_name, last_name: last_name
end

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

charge_range = 100..15_000
[5, 3, 1, 1].each.with_index(1) do |count, customer_id|
  count.times do
    Charge.create paid: true,
                  amount: rand(charge_range),
                  refunded: false,
                  customer_id: customer_id
  end
end

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4
[3, 2].each.with_index(3) do |count, customer_id|
  count.times do
    Charge.create paid: false,
                  amount: rand(charge_range),
                  refunded: false,
                  customer_id: customer_id
  end
end

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2
[3, 2].each.with_index(1) do |count, customer_id|
  count.times do
    Charge.create paid: true,
                  amount: rand(charge_range),
                  refunded: true,
                  customer_id: customer_id
  end
end
