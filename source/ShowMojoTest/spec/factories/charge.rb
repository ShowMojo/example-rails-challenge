FactoryGirl.define do
  factory :charge do
    amount_cents { rand(10000) }
    paid true
    refunded false
    customer
  end

  trait :successful do
    paid true
    refunded false
  end

  trait :failed do
    paid false
    refunded false
  end

  trait :disputed do
    paid true
    refunded true
  end
end
