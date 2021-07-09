include ChargeSeederService

customers_attributes = [
  {
    first_name: 'Johny',
    last_name: 'Flow'
  },
  {
    first_name: 'Raj',
    last_name: 'Jamnis'
  },
  {
    first_name: 'Andrew',
    last_name: 'Chung'
  },
  {
    first_name: 'Mike',
    last_name: 'Smith'
  }
]

Customer.create(customers_attributes)

Customer.all.each_with_index do |customer, index|
  case index
  when 0
    create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 5)
    create_credit_card_charge(customer, CHARGE_STATUSES[:disputed], 3)
  when 1
    create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 3)
    create_credit_card_charge(customer, CHARGE_STATUSES[:disputed], 2)
  when 2
    create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 1)
    create_credit_card_charge(customer, CHARGE_STATUSES[:failed], 3)
  when 3
    create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 1)
    create_credit_card_charge(customer, CHARGE_STATUSES[:failed], 2)
  end
end
