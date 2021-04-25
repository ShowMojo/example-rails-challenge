# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  customer1 = Customer.where(
    first_name: 'Johny',
    last_name: 'Flow'
  ).first_or_create!

  customer2 = Customer.where(
    first_name: 'Raj',
    last_name: 'Jamnis'
  ).first_or_create!

  customer3 = Customer.where(
    first_name: 'Andrew',
    last_name: 'Chung'
  ).first_or_create!

  customer4 = Customer.where(
    first_name: 'Mike',
    last_name: 'Smith'
  ).first_or_create!

  # Successful charges
  5.times do
    Charge.create!(
      customer: customer1,
      paid: true,
      amount: 4900,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end

  3.times do
    Charge.create!(
      customer: customer2,
      paid: true,
      amount: 4800,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end

  Charge.create!(
    customer: customer3,
    paid: true,
    amount: 4700,
    currency: 'usd',
    created: Time.zone.at(1_389_618_241)
  )

  Charge.create!(
    customer: customer4,
    paid: true,
    amount: 4600,
    currency: 'usd',
    created: Time.zone.at(1_389_618_241)
  )

  # Failed charges
  3.times do
    Charge.create!(
      customer: customer3,
      paid: false,
      amount: 4700,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end

  2.times do
    Charge.create!(
      customer: customer4,
      paid: false,
      amount: 4600,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end

  # Disputed charges
  3.times do
    Charge.create!(
      customer: customer1,
      paid: true,
      refunded: true,
      amount: 4900,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end

  2.times do
    Charge.create!(
      customer: customer2,
      paid: true,
      refunded: true,
      amount: 4800,
      currency: 'usd',
      created: Time.zone.at(1_389_618_241)
    )
  end
end
