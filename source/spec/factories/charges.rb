FactoryGirl.define do
  factory :charge do
    customer
  end

  trait :failed do
    paid      { false }
    refunded  { false }
  end

  trait :disputed do
    paid      { true }
    refunded  { true }
  end

  trait :successful do
    paid      { true }
    refunded  { false }
  end
end
