FactoryGirl.define do
  factory :charge do
    currency 'usd'
    amount Random.rand(10..100)

    trait :failed do
      paid false
    end
    trait :successful do
      paid true
      refunded false
    end
    trait :disputed do
      paid true
      refunded true
    end
  end
end
