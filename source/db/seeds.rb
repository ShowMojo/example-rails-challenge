# frozen_string_literal: true

Customer.delete_all
CUSTOMERS = [['Johny', 'Flow'], ['Raj', 'Jamnis'], ['Andrew', 'Chung'], ['Mike', 'Smith']]
CUSTOMERS.each do |first_name, last_name|
  Customer.create!(first_name: first_name, last_name: last_name)
end
