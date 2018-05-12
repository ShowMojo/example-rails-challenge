c1 = Customer.create!({first_name: "Johny", last_name: "Flow"})
c2 = Customer.create!({first_name: "Raj", last_name: "Jamnis"})
c3 = Customer.create!({first_name: "Andrew", last_name: "Chung"})
c4 = Customer.create!({first_name: "Mike", last_name: "Smith"})


5.times { Charge.successful.create!(amount: rand(50..150), currency: "usd", customer: c1) }
3.times { Charge.successful.create!(amount: rand(50..150), currency: "usd", customer: c2) }
1.times { Charge.successful.create!(amount: rand(50..150), currency: "usd", customer: c3) }
1.times { Charge.successful.create!(amount: rand(50..150), currency: "usd", customer: c4) }

3.times { Charge.failed.create!(amount: rand(50..150), currency: "usd", customer: c3) }
2.times { Charge.failed.create!(amount: rand(50..150), currency: "usd", customer: c4) }

3.times { Charge.disputed.create!(amount: rand(50..150), currency: "usd", customer: c1) }
2.times { Charge.disputed.create!(amount: rand(50..150), currency: "usd", customer: c2) }
