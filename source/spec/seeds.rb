users = [
    {
        id: 1,
        first_name: "Johny",
        last_name: "Flow"
    },
    {
        id: 2,
        first_name: "Raj",
        last_name: "Jamnis"
    },
    {
        id: 3,
        first_name: "Andrew",
        last_name: "Chung"
    },
    {
        id: 4,
        first_name: "Mike",
        last_name: "Smith"
    }
]
users.each { |user|
  User.create(user)
}

1.upto(5) do |i|
  CreditCardOperation.create(paid: true,
                             amount: 1.5,
                             currency: "usd",
                             refunded: false,
                             user_id: 1)
end

6.upto(8) do |i|
  CreditCardOperation.create(paid: true,
                             amount: 1.5,
                             currency: "usd",
                             refunded: false,
                             user_id: 2)
end

CreditCardOperation.create(paid: true,
                           amount: 1.5,
                           currency: "usd",
                           refunded: false,
                           user_id: 3)

CreditCardOperation.create(paid: true,
                           amount: 1.5,
                           currency: "usd",
                           refunded: false,
                           user_id: 4)

1.upto(3) do |i|
  CreditCardOperation.create(paid: false,
                             amount: 1.5,
                             currency: "usd",
                             refunded: false,
                             user_id: 3)
end

4.upto(5) do |i|
  CreditCardOperation.create(paid: false,
                             amount: 1.5,
                             currency: "usd",
                             refunded: false,
                             user_id: 4)
end

1.upto(3) do |i|
  CreditCardOperation.create(paid: true,
                             amount: 1.5,
                             currency: "usd",
                             refunded: true,
                             user_id: 1)
end

4.upto(5) do |i|
  CreditCardOperation.create(paid: true,
                             amount: 1.5,
                             currency: "usd",
                             refunded: true,
                             user_id: 2)
end
