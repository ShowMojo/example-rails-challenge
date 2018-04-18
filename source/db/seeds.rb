customers = ['Johny Flow', 'Raj Jamnis', 'Andrew Chung', 'Mike Smith']

def seed_credit_card_charges(customer, charge_status) 
  CreditCardCharge.create({
    paid: true,
    amount: rand(10000),
    currency: 'USD',
    customer: customer,
    status: charge_status,
  })
end

(0..3).each do |i| 
  customer = customers[i].split(' ')
  created_customer = Customer.find_or_create_by(first_name: customer[0], last_name: customer[1])

  # setup a swicth to seed charges as well
  case(i) 
  when 0
    # seed customer 1 credit card charges
    5.times do 
      seed_credit_card_charges(created_customer, :successful)
    end
    3.times do 
      seed_credit_card_charges(created_customer, :disputed)
    end
  when 1
      # seed customer 2 credit card charges
      3.times do 
        seed_credit_card_charges(created_customer, :successful)
      end
      2.times do 
        seed_credit_card_charges(created_customer, :disputed)
      end
  when 2
    # seed customer 3 credit card charges
    1.times do 
      seed_credit_card_charges(created_customer, :successful)
    end
    3.times do 
      seed_credit_card_charges(created_customer, :failed)
    end
  when 3
    # seed customer 4 credit card charges
    1.times do 
      seed_credit_card_charges(created_customer, :successful)
    end
    2.times do 
      seed_credit_card_charges(created_customer, :failed)
    end
  end
end

puts "Done"