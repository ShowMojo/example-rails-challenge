# frozen_string_literal: true

Customer.delete_all
CreditCardCharge.delete_all

CUSTOMERS_ATTRS = [{first_name: 'Johny', last_name: 'Flow'},
                   {first_name: 'Raj', last_name: 'Jamnis'},
                   {first_name: 'Andrew', last_name: 'Chung'},
                   {first_name: 'Mike', last_name: 'Smith'}]

CC_CHARGE_STATUS = {
  successful: {paid: true, refunded: false},
  failed: {paid: false, refunded: false},
  disputed: {paid: true, refunded: true}
}

customers = {}
CC_CHARGE_STATUS.keys.zip([[5, 3, 1, 1], [0, 0, 3, 2], [3, 2, 0, 0]]).to_h.each do |status, transactions_amount|
  transactions_amount.each_with_index do |num, idx|
    customers[idx] ||= Customer.create!(**CUSTOMERS_ATTRS[idx])
    num.times do
      credit_card_charge_attr = {
        currency: CreditCardCharge::DEFAULT_CURRENCY,
        amount: rand(1500..6000)
      }.merge(CC_CHARGE_STATUS[status])
      customers[idx].credit_card_charges.create!(credit_card_charge_attr)
    end
  end
end
