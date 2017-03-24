# frozen_string_literal: true
FactoryGirl.define do
  factory :charge do
    amount { Faker::Number.decimal(2, 8) }
    currency 'usd'
  end
end
