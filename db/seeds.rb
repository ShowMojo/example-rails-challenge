# Seed customers
c1 = Customer.find_or_create_by!(first_name: 'Johny', last_name: 'Flow')
c2 = Customer.find_or_create_by!(first_name: 'Raj', last_name: 'Jamnis')
c3 = Customer.find_or_create_by!(first_name: 'Andrew', last_name: 'Chung')
c4 = Customer.find_or_create_by!(first_name: 'Mike', last_name: 'Smith')

# Seed charges
if Charge.count.zero?
  # successful 
  5.times do 
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c1)
  end
  3.times do 
    FactoryBot.create(:charge, paid: true, refunded: false, customer: c2)
  end
  FactoryBot.create(:charge, paid: true, refunded: false, customer: c3)
  FactoryBot.create(:charge, paid: true, refunded: false, customer: c4)

  # failed 
  3.times do 
    FactoryBot.create(:charge, paid: false, refunded: false, customer: c3)
  end
  2.times do 
    FactoryBot.create(:charge, paid: false, refunded: false, customer: c4)
  end

  # refunded 
  3.times do 
    FactoryBot.create(:charge, paid: true, refunded: true, customer: c1)
  end
  2.times do 
    FactoryBot.create(:charge, paid: true, refunded: true, customer: c2)
  end
end 

p "Seed done!"