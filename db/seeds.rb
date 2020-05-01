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
5.times { FactoryBot.create(:charge, paid: true, refunded: false, customer: customer_1) }
3.times { FactoryBot.create(:charge, paid: true, refunded: false, customer_id: customer_2) }
FactoryBot.create(:charge, paid: true, refunded: false, customer_id: customer_3)
FactoryBot.create(:charge, paid: true, refunded: false, customer_id: customer_4)

# failed
3.times { FactoryBot.create(:charge, paid: false, refunded: false, customer_id: customer_3) }
2.times { FactoryBot.create(:charge, paid: false, refunded: false, customer_id: customer_4) }

# refunded
3.times { FactoryBot.create(:charge, paid: true, refunded: true, customer_id: customer_1) }
2.times { FactoryBot.create(:charge, paid: true, refunded: true, customer_id: customer_2) }

p "Seeding completed"
