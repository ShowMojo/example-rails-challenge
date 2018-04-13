# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.find_or_create_by(first_name: 'Johny', last_name: 'Flow')
Customer.find_or_create_by(first_name: 'Raj', last_name: 'Jamnis')
Customer.find_or_create_by(first_name: 'Andrew', last_name: 'Chung')
Customer.find_or_create_by(first_name: 'Mike', last_name: 'Smith')
p '=======Created Customers (4) ========'

20.times do |i|

  charge_attr = {
    created: DateTime.now,
    paid: true,
    amount: rand(1..90)*100,
    refunded: false,
    customer_id: 1
  }

  charge_attr[:customer_id] = 2 if i > 5
  charge_attr[:customer_id] = 3 if i > 7
  charge_attr[:customer_id] = 4 if i > 8

  if i > 9
    charge_attr[:customer_id] = 3
    charge_attr[:paid] = false
  end
  if i > 12
    charge_attr[:customer_id] = 4
  end
  if i > 14
    charge_attr[:customer_id] = 1
    charge_attr[:paid] = true
    charge_attr[:refunded] = true
  end
  if i > 17
    charge_attr[:customer_id] = 2
  end
  Charge.find_or_create_by(charge_attr)
end
p '=======Created Charges (20) ========'
