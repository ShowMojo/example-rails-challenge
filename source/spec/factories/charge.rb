FactoryGirl.define do
  factory :charge do
    customer

    trait :failed do
      paid false
      amount 1000
    end

    trait :disputed do
      refunded true
      amount 2000
    end

    trait :successful do
      paid true
      amount 3000
    end
  end
end

