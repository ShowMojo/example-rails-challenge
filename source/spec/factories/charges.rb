# frozen_string_literal: true

FactoryBot.define do
  factory :charge do
    customer
    amount    { rand(10..700) }
    currency  { 0 }
    paid      { false }
    refunded  { false }

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
