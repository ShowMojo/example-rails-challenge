Customer.create([
  {first_name: "Johny", last_name: "Flow"},
  {first_name: "Raj", last_name: "Jamnis"},
  {first_name: "Andrew", last_name: "Chung"},
  {first_name: "Mike", last_name: "Smith"}
])

customers = Customer.all

# successful charges
5.times { customers[0].charges.create(paid: true, amount: 1021) }
3.times { customers[1].charges.create(paid: true, amount: 2512) }
customers[2].charges.create(paid: true, amount: 3312)
customers[3].charges.create(paid: true, amount: 3312)

# failed charges
3.times { customers[2].charges.create(paid:false, amount: 4444) }
2.times { customers[1].charges.create(paid: false, amount: 5555) }

# disputed charges
3.times { customers[0].charges.create(paid: true, refunded: true, amount: 6666) }
2.times { customers[1].charges.create(paid: true, refunded: true, amount: 7777) }