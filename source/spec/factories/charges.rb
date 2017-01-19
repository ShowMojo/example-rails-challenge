FactoryGirl.define do
  factory :charge do
    paid false
    amount { rand(10000..100000) }
    currency "MyString"
    refunded false
    customer nil

    trait :succeed do
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
