FactoryBot.define do
  factory :charge do
    created { "2021-05-31 15:50:15" }
    paid { false }
    amount { rand(1..10000) }
    currency { "usd" }
    refunded { false }
    customer

    trait :successful do
      paid { true }
      refunded { false }
    end

    trait :failed do
      paid { false }
      refunded { false }
    end

    trait :disputed do
      paid { true }
      refunded { true }
    end
  end
end
