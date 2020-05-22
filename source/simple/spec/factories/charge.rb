FactoryGirl.define do
  factory :charge do
    amount { Faker::Number.number(5) }
    currency 'usd'
    paid true
    refunded false
    customer
  end
end
