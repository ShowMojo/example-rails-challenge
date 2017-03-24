# frozen_string_literal: true
FactoryGirl.define do
  factory :customer do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end
end
