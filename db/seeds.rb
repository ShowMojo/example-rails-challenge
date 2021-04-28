# Customer 1:
#   First Name: Johny
#   Last Name: Flow
#
# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis
#
# Customer 3:
#   First Name: Andrew
#   Last Name: Chung
#
# Customer 4:
#   First Name: Mike
#   Last Name: Smith

customers = [
  { first_name: 'Johny', last_name: 'Flow' },
  { first_name: 'Raj', last_name: 'Jamnis' },
  { first_name: 'Andrew', last_name: 'Chung' },
  { first_name: 'Mike', last_name: 'Smith' }
]

customers.each { |customer| Customer.create!(customer) }

# 10 Should be successful transactions:
# - 5 Should be linked to Customer 1
# - 3 Should be linked to Customer 2
# - 1 Should be linked to Customer 3
# - 1 Should be linked to Customer 4
#
# 5 Should be transactions that failed:
# - 3 Should be linked to Customer 3
# - 2 Should be linked to Customer 4
#
# 5 should be disputed:
# - 3 should be linked to Customer 1
# - 2 should be linked to customer 2

customers_ids = Customer.ids

transactions = [
  {
    successful: [
      { charges_amount: 5, customer_id: customers_ids[0] },
      { charges_amount: 3, customer_id: customers_ids[1] },
      { charges_amount: 1, customer_id: customers_ids[2] },
      { charges_amount: 1, customer_id: customers_ids[3] }
    ]
  },
  {
    failed: [
      { charges_amount: 3, customer_id: customers_ids[2] },
      { charges_amount: 2, customer_id: customers_ids[3] }
    ]
  },
  {
    disputed: [
      { charges_amount: 3, customer_id: customers_ids[0] },
      { charges_amount: 2, customer_id: customers_ids[1] }
    ]
  }
]

charge_repo = ChargeRepo.new(model: Charge)

transactions.each_with_index do |transactions_by_status, index|
  transactions_by_status.each do |status, collection|
    collection.each do |entity|
      entity.fetch(:charges_amount).times do |number|
        randomization_salt = (index + 1) * (number + 1)

        charge_repo.create!(
          customer_id: entity.fetch(:customer_id),
          amount: rand((randomization_salt * 10)..(randomization_salt * 100)),
          created: Time.now + rand((randomization_salt * 1)..(randomization_salt * 10)).hours,
          status: status
        )
      end
    end
  end
end