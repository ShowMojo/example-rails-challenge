FactoryBot.define do
  factory :charge do
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
  end
end
