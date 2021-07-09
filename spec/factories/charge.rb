FactoryBot.define do
  factory :charge do
    id { Faker::Number.number(digits: 5).to_i }
    add_attribute(:created) { Faker::Time.between(from: 10.days.ago, to: Date.today) }
    paid { Faker::Boolean }
    amount { Faker::Number.decimal(l_digits: 2) }
    currency { "usd" }
    refunded { Faker::Boolean }
  end
end
