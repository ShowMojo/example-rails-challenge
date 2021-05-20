# Cleaning database
Customer.destroy_all

# Creating customer
customers = [
  { first_name: "Johny",
    last_name: "Flow"
  },
  { first_name: "Raj",
    last_name: "Jamnis"
  },
  { first_name: "Andrew",
    last_name: "Chung"
  },
  { first_name: "Mike",
    last_name: "Smith"
  }
]
Customer.create(customers)

# Creating successful transactions
5.times do
  Charge.create(paid: true,
                amount: 4900,
                currency: "usd",
                refunded: false,
                customer_id: Customer.first.id
  )
end

3.times do
  Charge.create(paid: true,
                amount: 2000,
                currency: "usd",
                refunded: false,
                customer_id: Customer.second.id
  )
end

Charge.create(paid: true,
              amount: 2500,
              currency: "usd",
              refunded: false,
              customer_id: Customer.second_to_last.id
)

Charge.create(paid: true,
              amount: 3000,
              currency: "usd",
              refunded: false,
              customer_id: Customer.last.id
)

# Creating failed transactions
3.times do
  Charge.create(paid: false,
                amount: 3100,
                currency: "usd",
                refunded: false,
                customer_id: Customer.second_to_last.id
  )
end

2.times do
  Charge.create(paid: false,
                amount: 2800,
                currency: "usd",
                refunded: false,
                customer_id: Customer.last.id
  )
end

# Creating disputed transactions
3.times do
  Charge.create(paid: true,
                amount: 4100,
                currency: "usd",
                refunded: true,
                customer_id: Customer.first.id
  )
end

2.times do
  Charge.create(paid: true,
                amount: 5500,
                currency: "usd",
                refunded: true,
                customer_id: Customer.second.id
  )
end