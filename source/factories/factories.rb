FactoryBot.define do
  factory :customer do
    first_name { "first name" }
    last_name { "first name" }
  end

  factory :charge do
    customer
    paid { true }
    amount { Random.rand(5_000) }
    currency { "USD" }
    refunded { false }
    status { Charge::STATUS_SUCCESSFUL }

    trait(:successful) { Charge::STATUS_SUCCESSFUL }
    trait(:failed) { Charge::STATUS_FAILED }
    trait(:disputed) { Charge::STATUS_DISPUTED }
  end
end
