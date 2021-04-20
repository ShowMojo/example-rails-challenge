# Seed the customers
customers =
  [%w(Johny Flow), %w(Raj Jamnis), %w(Andrew Chung), %w(Mike Smith)].map do |name, sirname|
    Customer.find_or_create_by(first_name: name, last_name: sirname)
  end

# Successful transactions
[5, 3, 1, 1].each_with_index do |transactions_number, customer_id|
  transactions_number.times do
    charge = Charge.new_random_payment(paid: true, customer: customers[customer_id])
    charge.save!
  end
end

# Failed transactions
[0, 0, 3, 2].each_with_index do |transactions_number, customer_id|
  transactions_number.times do
    charge = Charge.new_random_payment(paid: false, customer: customers[customer_id])
    charge.save!
  end
end

# Disputed transactions - as i understood it's paid, but refunded charges
[3, 2].each_with_index do |transactions_number, customer_id|
  transactions_number.times do
    charge = Charge.new_random_payment(paid: true, customer: customers[customer_id])
    charge.save!
    charge.refund!
  end
end
