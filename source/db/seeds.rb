# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
###### Seed 4 Customers into the system:
#
#    Customer 1:
#      First Name: Johny
#      Last Name: Flow
#
#    Customer 2:
#      First Name: Raj
#      Last Name: Jamnis
#
#    Customer 3:
#      First Name: Andrew
#      Last Name: Chung
#
#    Customer 4:
#      First Name: Mike
#      Last Name: Smith
#
#
###### Seed 20 transactions (charges) into the system:
#
#    10 Should be successful transactions:
#      - 5 Should be linked to Customer 1
#      - 3 Should be linked to Customer 2
#      - 1 Should be linked to Customer 3
#      - 1 Should be linked to Customer 4
#
#    5 Should be transactions that failed:
#      - 3 Should be linked to Customer 3
#      - 2 Should be linked to Customer 4
#
#    5 should be disputed:
#      - 3 should be linked to Customer 1
#      - 2 should be linked to customer 2
#
require 'factory_bot_rails'
[
  { customer: { first_name: "John",   last_name: "Flow" },   charges: { successful: 5, failed: 0, disputed: 3 } },
  { customer: { first_name: "Raj",    last_name: "Jamnis" }, charges: { successful: 3, failed: 0, disputed: 2 } },
  { customer: { first_name: "Andrew", last_name: "Chung" },  charges: { successful: 1, failed: 3, disputed: 0 } },
  { customer: { first_name: "Mike",   last_name: "Smith" },  charges: { successful: 1, failed: 2, disputed: 0 } }
].each do |h|
  customer = Customer.where(h[:customer]).first_or_create

  if customer.previously_new_record?
    h[:charges].each do |k, v|
      FactoryBot.create_list :charge, v, k, customer: customer
    end
  end
end
