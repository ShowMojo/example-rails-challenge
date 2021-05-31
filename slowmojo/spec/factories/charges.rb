FactoryBot.define do
  factory :charge do
    created { "2021-05-31 15:50:15" }
    paid { false }
    amount { rand(1..10000) }
    currency { "usd" }
    refunded { false }
    customer
  end
end
