# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Charge.delete_all
Customer.delete_all

customers = [
  %w(Johny Flow), %w(Raj Jamnis), %w(Andrew Chung), %w(Mike Smith)
]

i = 1
customers.each do |fullname|
  Customer.create(id: i, first_name: fullname.first, last_name: fullname.last)
  i += 1
end

charge_data = {
  created: Time.now.to_i,
  amount: rand(100...10000),
  currency: 'usd',
}

# successful charges
successful_charge_data = charge_data.merge(
  paid: true,
  refunded: false
)
5.times { Charge.create(successful_charge_data.merge(customer_id: 1)) }
3.times { Charge.create(successful_charge_data.merge(customer_id: 2)) }
Charge.create(successful_charge_data.merge(customer_id: 3))
Charge.create(successful_charge_data.merge(customer_id: 4))

# failed charges
failed_charge_data = charge_data.merge(
  paid: false,
  refunded: false
)
3.times { Charge.create(failed_charge_data.merge(customer_id: 3)) }
2.times { Charge.create(failed_charge_data.merge(customer_id: 4)) }

# disputed charges
disputed_charge_data = charge_data.merge(
  paid: true,
  refunded: true
)
3.times { Charge.create(disputed_charge_data.merge(customer_id: 1)) }
2.times { Charge.create(disputed_charge_data.merge(customer_id: 2)) }