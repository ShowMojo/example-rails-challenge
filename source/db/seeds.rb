Customer.delete_all
CreditCardCharge.delete_all

customers_data = [
  { name: "Johny Flow", successful: 5, failed: 0, disputed: 3 },
  { name: "Raj Jamnis", successful: 3, failed: 0, disputed: 2 },
  { name: "Andrew Chung", successful: 1, failed: 3, disputed: 0 },
  { name: "Mike Smith", successful: 1, failed: 2, disputed: 0 },
]

customers_data.each do |data|
  first_name, last_name = data[:name].split(' ')
  customer = Customer.create(first_name: first_name, last_name: last_name)

  [:successful, :failed, :disputed].each do |charge_type|
    charge_type_attrs = {
      successful: { paid: true, currency: 'usd', refunded: false, customer: customer},
      failed: { paid: false, currency: 'usd', refunded: false, customer: customer},
      disputed: { paid: true, currency: 'usd', refunded: true, customer: customer}
    }
    1000.step(by: 1000, to: data[charge_type] * 1000) do |amount|
      CreditCardCharge.create(charge_type_attrs[charge_type].merge(amount: amount))
    end
  end
end
