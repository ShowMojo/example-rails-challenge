customers = [
  {
    first_name: "Johny",
    last_name: "Flow",
  },
  {
    first_name: "Raj",
    last_name: "Jamnis",
  },
  {
    first_name: "Andrew",
    last_name: "Chung",
  },
  {
    first_name: "Mike",
    last_name: "Smith",
  }
]

customers = customers.map{ |customer| Customer.create(customer) }

# Successful Charges
5.times do
  customers[0].charges.create(paid:true, refunded: false, currency: "USD", amount: 99.99)
end

3.times do
  customers[1].charges.create(paid:true, refunded: false, currency: "USD", amount: 99.99)
end

customers[2].charges.create(paid:true, refunded: false, currency: "USD", amount: 99.99)
customers[3].charges.create(paid:true, refunded: false, currency: "USD", amount: 99.99)

# Failed Charges
3.times do
  customers[2].charges.create(paid:false, refunded: false, currency: "USD", amount: 99.99)
end

2.times do
  customers[3].charges.create(paid:false, refunded: false, currency: "USD", amount: 99.99)
end

# Disputed charges
3.times do
  customers[0].charges.create(paid:true, refunded: true, currency: "USD", amount: 99.99)
end

2.times do
  customers[1].charges.create(paid:true, refunded: true, currency: "USD", amount: 99.99)
end
