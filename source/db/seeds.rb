cus1 = Customer.find_or_create_by(first_name: 'Johny', last_name: 'Flow')
cus2 = Customer.find_or_create_by(first_name: 'Raj', last_name: 'Jamnis')
cus3 = Customer.find_or_create_by(first_name: 'Andrew', last_name: 'Chung')
cus4 = Customer.find_or_create_by(first_name: 'Mike', last_name: 'Smith')

FactoryBot.create_list(:paid_charge, 5, customer: cus1)
FactoryBot.create_list(:paid_charge, 3, customer: cus2)
FactoryBot.create_list(:paid_charge, 1, customer: cus3)
FactoryBot.create_list(:paid_charge, 1, customer: cus4)

FactoryBot.create_list(:failed_charge, 3, customer: cus3)
FactoryBot.create_list(:failed_charge, 2, customer: cus4)

FactoryBot.create_list(:disputed_charge, 3, customer: cus1)
FactoryBot.create_list(:disputed_charge, 2, customer: cus2)
