# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { %w[Johny Raj Andrew Mike].sample }
    last_name  { %w[Flow Jamnis Chung Smith].sample }
  end
end
