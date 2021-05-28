# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Customer data
def create_customer
  puts "Importing Customer data"
  customer_data = [ {first_name: 'Johny', last_name: 'Flow'},
                    {first_name: 'Raj', last_name: 'Jamnis'},
                    {first_name: 'Andrew', last_name: 'Chung'},
                    {first_name: 'Mike', last_name: 'Smith'}]

  customer_data.each do |data|
    Customer.find_or_create_by(data)
  end

  puts "Customer data imported successfully."
end

create_customer


#Credit Card Charge data
def create_credit_card_charge
  customer1 = Customer.find_by(first_name: 'Johny', last_name: 'Flow')
  customer2 = Customer.find_by(first_name: 'Raj', last_name: 'Jamnis')
  customer3 = Customer.find_by(first_name: 'Andrew', last_name: 'Chung')
  customer4 = Customer.find_by(first_name: 'Mike', last_name: 'Smith')
  
  # Success Transaction
  puts " Success Transaction importing......"
  Transaction.create([ {created: (Time.now + 1.hours).to_i, paid: true, amount: 1000, currency: 'usd', refunded: false, customer: customer1},
                                  {created: (Time.now + 2.hours).to_i, paid: true, amount: 1500, currency: 'usd', refunded: false, customer: customer1},
                                  {created: (Time.now + 3.hours).to_i, paid: true, amount: 2000, currency: 'usd', refunded: false, customer: customer1},
                                  {created: (Time.now + 4.hours).to_i, paid: true, amount: 2500, currency: 'usd', refunded: false, customer: customer1},
                                  {created: (Time.now + 5.hours).to_i, paid: true, amount: 3000, currency: 'usd', refunded: false, customer: customer1},
                                  {created: (Time.now + 6.hours).to_i, paid: true, amount: 4000, currency: 'usd', refunded: false, customer: customer2},
                                  {created: (Time.now + 7.hours).to_i, paid: true, amount: 5000, currency: 'usd', refunded: false, customer: customer2},
                                  {created: (Time.now + 8.hours).to_i, paid: true, amount: 6000, currency: 'usd', refunded: false, customer: customer2},
                                  {created: (Time.now + 9.hours).to_i, paid: true, amount: 4500, currency: 'usd', refunded: false, customer: customer3},
                                  {created: (Time.now + 10.hours).to_i, paid: true, amount: 5500, currency: 'usd', refunded: false, customer: customer4}])
  puts "Success Transaction import done."
  # Failded Transaction
  puts " Failed Transaction importing......"
  Transaction.create([ {created: (Time.now + 1.hours).to_i, paid: false, amount: 1000, currency: 'usd', refunded: false, customer: customer3},
                                  {created: (Time.now + 2.hours).to_i, paid: false, amount: 1500, currency: 'usd', refunded: false, customer: customer3},
                                  {created: (Time.now + 3.hours).to_i, paid: false, amount: 2000, currency: 'usd', refunded: false, customer: customer3},
                                  {created: (Time.now + 4.hours).to_i, paid: false, amount: 2500, currency: 'usd', refunded: false, customer: customer4},
                                  {created: (Time.now + 5.hours).to_i, paid: false, amount: 3000, currency: 'usd', refunded: false, customer: customer4}])
  puts "Failed Transaction import done."
  # Dispute Transaction
  puts " Disputed Transaction importing......"
  Transaction.create([  {created: (Time.now + 6.hours).to_i, paid: false, amount: 4000, currency: 'usd', refunded: true, customer: customer1},
                        {created: (Time.now + 7.hours).to_i, paid: false, amount: 5000, currency: 'usd', refunded: true, customer: customer1},
                        {created: (Time.now + 8.hours).to_i, paid: false, amount: 6000, currency: 'usd', refunded: true, customer: customer1},
                        {created: (Time.now + 9.hours).to_i, paid: false, amount: 4500, currency: 'usd', refunded: true, customer: customer2},
                        {created: (Time.now + 10.hours).to_i, paid: false, amount: 5500, currency: 'usd', refunded: true, customer: customer2}])
  puts "Disputed Transaction import done."
end

create_credit_card_charge