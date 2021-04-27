FactoryBot.define do
  factory :charge do
    created { Time.now }
    amount { 4900 }
    currency { 'usd' }
    refunded { false }

    trait :successful do
      paid { true }
    end

    trait :failed do
      paid { false }
    end

    trait :disputed do
      paid { true }
      refunded { true }
    end
  end
end
