Customer.create(first_name: 'Johny', last_name: 'Flow').tap do |customer|
  5.times do
    Charge.create(paid: true, amount: 100, currency: 'usd', refunded: false, customer: customer)
  end

  3.times do
    Charge.create(paid: true,  amount: 150, currency: 'usd', refunded: true, customer: customer)
  end
end

Customer.create(first_name: 'Raj', last_name: 'Jamnis').tap do |customer|
  3.times do
    Charge.create(paid: true, amount: 100, currency: 'usd', refunded: false, customer: customer)
  end

  2.times do
    Charge.create(paid: true,  amount: 150, currency: 'usd', refunded: true, customer: customer)
  end
end

Customer.create(first_name: 'Andrew', last_name: 'Chung').tap do |customer|
  1.times do
    Charge.create(paid: true, amount: 100, currency: 'usd', refunded: false, customer: customer)
  end

  3.times do
    Charge.create(paid: false,  amount: 150, currency: 'usd', refunded: false, customer: customer)
  end
end

Customer.create(first_name: 'Mike', last_name: 'Smith').tap do |customer|
  1.times do
    Charge.create(paid: true, amount: 100, currency: 'usd', refunded: false, customer: customer)
  end

  2.times do
    Charge.create(paid: false,  amount: 150, currency: 'usd', refunded: false, customer: customer)
  end
end