customers = [
  {
     first_name: 'Johny',
      last_name: 'Flow',
     successful: 5,
         failed: 0,
       disputed: 3
  },
  {
     first_name: 'Raj',
      last_name: 'Jamnis',
     successful: 3,
         failed: 0,
       disputed: 2
  },
  {
     first_name: 'Andrew',
      last_name: 'Chang',
     successful: 1,
         failed: 3,
       disputed: 0
  },
  {
     first_name: 'Mike',
      last_name: 'Smith',
     successful: 1,
         failed: 2,
       disputed: 0
  }
]

customers.each do |hash|
  customer = Customer.find_or_create_by!(hash.slice(:first_name, :last_name))

  range = (100..100_000)

  if (count = customer.charges.successful.count) < hash[:successful]
    (hash[:successful] - count).times do
      customer.charges.create!(amount: rand(range), currency: 'usd')
    end
  end

  if (count = customer.charges.failed.count) < hash[:failed]
    (hash[:failed] - count).times do
      customer.charges.create!(amount: rand(range), currency: 'usd', paid: false)
    end
  end

  if (count = customer.charges.disputed.count) < hash[:disputed]
    (hash[:disputed] - count).times do
      customer.charges.create!(amount: rand(range), currency: 'usd', refunded: true)
    end
  end
end
