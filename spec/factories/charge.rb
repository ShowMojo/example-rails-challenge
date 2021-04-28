FactoryBot.define do 
  factory :charge do
    paid { Faker::Boolean }
    amount { Faker::Number.decimal(l_digits: 4) }
    currency { "USD" }
    refunded { Faker::Boolean }
  end

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