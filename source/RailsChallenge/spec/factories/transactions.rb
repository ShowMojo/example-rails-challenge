FactoryBot.define do
  factory :transaction do
    amount { 1 }
    customer { nil }
    paid { false }
    refunded { false }
    currency { "MyString" }
    created { 1 }
  end
end
