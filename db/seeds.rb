customers =
  [
    { id: 1, first_name: 'Johny', last_name: 'Flow' },
    { id: 2, first_name: 'Raj', last_name: 'Jamnis' },
    { id: 3, first_name: 'Andrew', last_name: 'Chung' },
    { id:4, first_name: 'Mike', last_name: 'Smith' }
  ]

customers.each do |customer|
  Customer.create(customer)
end

charges =
  [
    { customer_id: 1, amount: '300'},
    { customer_id: 1, amount: '301'},
    { customer_id: 1, amount: '302'},
    { customer_id: 1, amount: '303'},
    { customer_id: 1, amount: '304'},
    { customer_id: 2, amount: '305'},
    { customer_id: 2, amount: '306'},
    { customer_id: 2, amount: '307'},
    { customer_id: 3, amount: '308'},
    { customer_id: 4, amount: '309'},
    { customer_id: 3, amount: '300', paid: false},
    { customer_id: 3, amount: '301', paid: false},
    { customer_id: 3, amount: '302', paid: false},
    { customer_id: 4, amount: '303', paid: false},
    { customer_id: 4, amount: '304', paid: false},
    { customer_id: 1, amount: '305', refunded: true},
    { customer_id: 1, amount: '306', refunded: true},
    { customer_id: 1, amount: '307', refunded: true},
    { customer_id: 2, amount: '308', refunded: true},
    { customer_id: 2, amount: '309', refunded: true},
  ]

charges.each do |charge|
  Charge.create(charge.merge({created: DateTime.now().to_i}))
end