FactoryBot.define do
  factory :charge do
    customer
    created { Time.now.to_i }
    paid { true }
    amount { 1500 }
    currency { 'USD' }
    refunded { false }

    trait :failed do
      paid { false }
    end

    trait :disputed do
      refunded { true }
    end
  end
end
