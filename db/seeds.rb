# Seed customers
p "Seeding 4 customers"
Customer.delete_all
customer_1 = FactoryBot.create(:customer)
customer_2 = FactoryBot.create(:customer)
customer_3 = FactoryBot.create(:customer)
customer_4 = FactoryBot.create(:customer)

# Seed charges
p "Seeding charges"
Charge.delete_all
# successful
5.times { FactoryBot.create(:charge, paid: true, refunded: false, customer_id: customer_1) }
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
