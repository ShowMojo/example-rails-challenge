# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


customers_yml_path = Rails.root.join('db', 'seeds', 'customers.yml')
customer_attributes = YAML::load_file(customers_yml_path)
Customer.create!(customer_attributes)

successful_transaction_data = {
  paid: true,
  amount: 4900,
  currency: 'usd',
  refunded: false
}
failed_transaction_data = {
  paid: false,
  amount: 4900,
  currency: 'usd',
  refunded: false
}
disputed_transaction_data = {
  paid: false,
  amount: 4900,
  currency: 'usd',
  refunded: true
}

customer_1 = Customer.find(1)
customer_2 = Customer.find(2)
customer_3 = Customer.find(3)
customer_4 = Customer.find(4)
5.times do
  customer_1.charges.build(successful_transaction_data)
end
3.times do
  customer_1.charges.build(disputed_transaction_data)
end

3.times do
  customer_2.charges.build(successful_transaction_data)
end
2.times do
  customer_2.charges.build(disputed_transaction_data)
end

customer_3.charges.build(successful_transaction_data)
3.times do
  customer_3.charges.build(failed_transaction_data)
end

customer_4.charges.build(successful_transaction_data)
2.times do
  customer_4.charges.build(failed_transaction_data)
end

customer_1.save!
customer_2.save!
customer_3.save!
customer_4.save!