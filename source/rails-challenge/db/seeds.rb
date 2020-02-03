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
customers.each_with_index do |customer_attributes, index|
  customer = Customer.find_or_create_by(customer_attributes)
  case (index + 1)
    when 1
      5.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618241,
            paid: true,
            amount: 4900 + _i,
            currency: "usd",
            refunded: false
          }
        )
      end
      3.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618242,
            paid: true,
            amount: 4000 + _i,
            currency: "usd",
            refunded: true
          }
        )
      end
    when 2
      3.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618243,
            paid: true,
            amount: 4500 + _i,
            currency: "usd",
            refunded: false
          }
        )
      end
      2.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618244,
            paid: true,
            amount: 4000 + _i,
            currency: "usd",
            refunded: true
          }
        )
      end
    when 3
      customer.charges.find_or_create_by(
        {
          created: 1389618245,
          paid: true,
          amount: 9900 ,
          currency: "usd",
          refunded: false
        }
      )
      3.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618246,
            paid: false,
            amount: 3900 + _i,
            currency: "usd",
            refunded: false,
          }
        )
      end
    when 4
      customer.charges.find_or_create_by(
        {
          created: 1389618247,
          paid: true,
          amount: 8900,
          currency: "usd",
          refunded: false,
        }
      )
      2.times do |_i|
        customer.charges.find_or_create_by(
          {
            created: 1389618248,
            paid: false,
            amount: 1900 + _i,
            currency: "usd",
            refunded: false,
          }
        )
      end
    else
      puts "nothing"
  end
end