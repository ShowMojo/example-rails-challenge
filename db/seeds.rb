# Seed customers
p "Seeding 4 customers"
Charge.delete_all
Customer.delete_all
customer_1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
customer_2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
customer_3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
customer_4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

# Seed charges
p "Seeding charges"
# successful
5.times { FactoryBot.create(:charge, :successful, customer: customer_1) }
3.times { FactoryBot.create(:charge, :successful, customer: customer_2) }
FactoryBot.create(:charge, :successful, customer: customer_3)
FactoryBot.create(:charge, :successful, customer: customer_4)

# failed
3.times { FactoryBot.create(:charge, :failed, customer: customer_3) }
2.times { FactoryBot.create(:charge, :failed, customer: customer_4) }

# disputed
3.times { FactoryBot.create(:charge, :disputed, customer: customer_1) }
2.times { FactoryBot.create(:charge, :disputed, customer: customer_2) }

p "Seeding completed"
