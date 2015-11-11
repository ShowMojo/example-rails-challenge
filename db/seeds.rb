# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Customer 1:
#   First Name: Johny
#   Last Name: Flow

# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis

# Customer 3:
#   First Name: Andrew
#   Last Name: Chung

# Customer 4:
#   First Name: Mike
#   Last Name: Smith

customer_1 = Customer.create(firstname: "Johny", lastname: "Flow")
customer_2 = Customer.create(firstname: "Raj", lastname: "Jamnis")
customer_3 = Customer.create(firstname: "Andrew", lastname: "Chung")
customer_4 = Customer.create(firstname: "Mike", lastname: "Smith")

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2

#  id          :integer          not null, primary key
#  customer_id :integer          not null
#  paid        :boolean          default(FALSE)
#  amount      :decimal(, )
#  refunded    :boolean          default(FALSE)
#  currency    :string           default("usd")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

5.times do
 CreditCardCharge.create(paid: true, amount: 15.0, refunded: false, customer: customer_1)
end

3.times do
 CreditCardCharge.create(paid: true, amount: 15.0, refunded: false, customer: customer_2)
 CreditCardCharge.create(paid: false, amount: 15.0, refunded: false, customer: customer_3)
 CreditCardCharge.create(paid: true, amount: 15.0, refunded: true, customer: customer_1)
end

2.times do
  CreditCardCharge.create(paid: false, amount: 15.0, refunded: false, customer: customer_4)
  CreditCardCharge.create(paid: true, amount: 15.0, refunded: true, customer: customer_2)
end

CreditCardCharge.create(paid: true, amount: 15.0, refunded: false, customer: customer_3)
CreditCardCharge.create(paid: true, amount: 15.0, refunded: false, customer: customer_4)
