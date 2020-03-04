# Successful transactions
johny = Customer.create first_name: "Johny", last_name: "Flow"
raj = Customer.create first_name: "Raj", last_name: "Jamis"
andrew = Customer.create first_name: "Andrew", last_name: "Chung"
mike = Customer.create first_name: "Mike", last_name: "Smith"

5.times do
  CreditCardCharge.create customer: johny, amount: rand(1..1000).to_f, paid: true, currency: :usd
end
3.times do
  CreditCardCharge.create customer: raj, amount: rand(1..1000).to_f, paid: true, currency: :usd
end
CreditCardCharge.create customer: andrew, amount: rand(1..1000).to_f, paid: true, currency: :usd
CreditCardCharge.create customer: mike, amount: rand(1..1000).to_f, paid: true, currency: :usd

# Failed transactions
3.times do
  CreditCardCharge.create customer: andrew, amount: rand(1..1000).to_f, currency: :usd
end
2.times do
  CreditCardCharge.create customer: mike, amount: rand(1..1000).to_f, currency: :usd
end

# Disputed transactions
3.times do
  CreditCardCharge.create customer: johny, amount: rand(1..1000).to_f, refunded: true, currency: :usd
end
2.times do
  CreditCardCharge.create customer: raj, amount: rand(1..1000).to_f, refunded: true, currency: :usd
end
