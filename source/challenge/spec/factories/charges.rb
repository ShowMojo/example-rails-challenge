FactoryGirl.define do
  factory :charge do
    customer
    amount { rand(1..5000) }
    currency 'usd'
    paid true
    refunded false
  end
end
