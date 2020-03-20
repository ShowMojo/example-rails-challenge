FactoryGirl.define do
  factory :charge do
    amount { rand(10000) }

    association :customer

    trait(:paid) do
      paid true
    end

    trait(:refunded) do
      refunded true
    end
  end
end
