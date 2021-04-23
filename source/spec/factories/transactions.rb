FactoryBot.define do
  factory :transaction do
    created { 1 }
    paid { false }
    amount { 1 }
    currency { "MyString" }
    refunded { false }
    customer { nil }
  end
end
