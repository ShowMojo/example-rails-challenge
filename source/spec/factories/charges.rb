FactoryBot.define do
  factory :charge do
    association :customer

    paid false
    amount { rand(10000) }
    currency 'usd'
    refunded false

    trait :paid do
      paid true
    end

    trait :disputed do
      paid true
      refunded true
    end

    factory :paid_charge, traits: [:paid]
    factory :disputed_charge, traits: [:disputed]
    factory :failed_charge
  end
end
