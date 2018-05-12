# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charge do
    amount 4900
    currency "usd"
    association :customer
    trait :successful do
      paid true
      refunded false
    end
    trait :disputed do
      paid true
      refunded true
    end
    trait :failed do
      paid false
    end
  end
end
