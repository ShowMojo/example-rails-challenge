FactoryGirl.define do
  factory :charge do
    amount { Faker::Number.number(6) }
    currency 'usd'
    paid true
    refunded false

    customer
  end
end 