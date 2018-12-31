# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

johny = Customer.create(first_name: "Johny", last_name: "Flow")
raj = Customer.create(first_name: "Raj", last_name: "Jamnis")
andrew = Customer.create(first_name: "Andrew", last_name: "Chung")
mike = Customer.create(first_name: "Mike", last_name: "Smith")

5.times { johny.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_SUCCESSFUL) }
3.times { raj.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_SUCCESSFUL) }
1.times { andrew.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_SUCCESSFUL) }
1.times { mike.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_SUCCESSFUL) }

3.times { andrew.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_FAILED) }
2.times { mike.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_FAILED) }

3.times { johny.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_DISPUTED) }
2.times { raj.charges << Charge.create(paid: true, amount: Random.rand(5_000), currency: "USD", refunded: false, status: Charge::STATUS_DISPUTED) }
