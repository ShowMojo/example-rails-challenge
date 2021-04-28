FactoryBot.define do
  factory :charge do
    amount { Faker::Number.unique.number(digits: 5) }
    currency { 'USD' }
    created { Faker::Time.unique.between(from: Time.now - 1.day, to: Time.now) }

    trait :successful do
      paid { true }
      refunded { false }
    end

    trait :failed do
      paid { false }
      refunded { true }
    end

    trait :disputed do
      paid { false }
      refunded { false }
    end
  end
end