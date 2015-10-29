amounts   = (1..10).to_a
currency  = 'usd'

[
  { first_name: 'Johny',  last_name: 'Flow',    ok: 5, failed: 0, disputed: 3 },
  { first_name: 'Raj',    last_name: 'Jamnis',  ok: 3, failed: 0, disputed: 2 },
  { first_name: 'Andrew', last_name: 'Chung',   ok: 1, failed: 3, disputed: 0 },
  { first_name: 'Mike',   last_name: 'Smith',   ok: 1, failed: 2, disputed: 0 }
].each do |options|
  customer = Customer.create(
    first_name: options[:first_name],
    last_name:  options[:last_name]
  )

  options[:ok].times do
    customer.charges.create(
      paid:     true,
      amount:   amounts.sample,
      currency: currency,
      refunded: false,
    )
  end

  options[:failed].times do
    customer.charges.create(
      paid:     false,
      amount:   amounts.sample,
      currency: currency,
      refunded: false,
    )
  end

  options[:disputed].times do
    customer.charges.create(
      paid:     true,
      amount:   amounts.sample,
      currency: currency,
      refunded: true,
    )
  end
end
