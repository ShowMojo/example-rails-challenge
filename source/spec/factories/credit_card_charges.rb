# frozen_string_literal: true

FactoryBot.define do
  factory :credit_card_charge do
    association :customer
    amount { 3500 }
    currency { CreditCardCharge::DEFAULT_CURRENCY }
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
