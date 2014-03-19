# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Charge.delete_all
Customer.delete_all

customers = [["Johny", "Flow"],
             ["Raj", "Jumnis"],
             ["Andrew", "Chung"],
             ["Mike", "Smith"]].map do |first_name, last_name|
  Customer.create(first_name: first_name,
                  last_name: last_name)
end

def create_charge options={}
  charge_data = {
    created: Time.now.to_i,
    paid: false,
    amount: 4900,
    currency: "usd",
    refunded: false,
    customer_id: 123
  }.merge(options)
  Charge.create(charge_data)
end

# Successful transactions
(1..5).each do |i|
  create_charge(paid: true,
                customer_id: customers[0].id,
                amount: i)
end

(6..8).each do |i|
  create_charge(paid: true,
                customer_id: customers[1].id,
                amount: i)
end

create_charge(paid: true,
              customer_id: customers[2].id,
              amount: 9)
create_charge(paid: true,
              customer_id: customers[3].id,
              amount: 10)

# Failed transactions
(11..13).each do |i|
  create_charge(paid: false,
                customer_id: customers[2].id,
                amount: i)
end

(14..15).each do |i|
  create_charge(paid: false,
                customer_id: customers[3].id,
                amount: i)
end

# Disputed transactions
(16..18).each do |i|
  create_charge(paid: true,
                refunded: true,
                customer_id: customers[0].id,
                amount: i)
end

(19..20).each do |i|
  create_charge(paid: true,
                refunded: true,
                customer_id: customers[1].id,
                amount: i)
end

