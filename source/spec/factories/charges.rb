FactoryBot.define do
  factory :charge do
    created { 1 }
    paid { false }
    amount { 1 }
    refunded { false }
    currency { "MyString" }
    customer { nil }
  end
end
