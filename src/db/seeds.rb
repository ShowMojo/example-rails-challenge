script_map = {
  success: [[5, 1], [3, 2], [1, 3], [1, 4]],
  failed: [[3, 3], [2, 4]],
  disputed: [[3, 1], [2, 2]],
}

data_customers = [
  { first_name: 'Johny', last_name: 'Flow' },   # Customer 1
  { first_name: 'Raj', last_name: 'Jamnis' },   # Customer 2
  { first_name: 'Andrew', last_name: 'Chung' }, # Customer 3
  { first_name: 'Mike', last_name: 'Smith' },   # Customer 4
]

customers_ids = data_customers.map do |data_customer|
  customer = Customer.find_or_create_by(data_customer)
  customer.id
end

script_map.each do |state, value|
  value.each do |total, customer_n|
    total.times do
      customer_id = customers_ids[customer_n - 1]
      charge          = Charge.find_or_initialize_by(customer_id: customer_id, state: state)
      charge.amount   = [*1000..5000].sample
      charge.refunded = [true, false].sample
      charge.paid     = [true, false].sample

      charge.save
    end
  end
end
