FactoryBot.define do
  factory :charge do
    created Time.zone.now
    amount Random.rand(10000)
    currency 'usd'

    trait :successful do
      paid true
      refunded false
    end

    trait :failed do
      paid false
    end

    trait :disputed do
      paid true
      refunded true
    end
    customer
  end
end