
customer_id = Customer.create(first_name: 'Johny', last_name: 'Flow').id

5.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: true, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)
end

3.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: false, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)
end


customer_id = Customer.create(first_name: 'Raj', last_name: 'Jamnis').id

3.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: true, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)
end

2.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: false, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)
end


customer_id = Customer.create(first_name: 'Andrew', last_name: 'Chung').id

Charge.create(created: Time.now.to_i - rand(5000), paid: true, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)

3.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: false, amount: rand(5000), currency: "usd", refunded: true, customer_id: customer_id)
end


customer_id = Customer.create(first_name: 'Mike', last_name: 'Smith').id

Charge.create(created: Time.now.to_i - rand(5000), paid: true, amount: rand(5000), currency: "usd", refunded: false, customer_id: customer_id)

2.times do
  Charge.create(created: Time.now.to_i - rand(5000), paid: false, amount: rand(5000), currency: "usd", refunded: true, customer_id: customer_id)
end
