FactoryBot.define do
  factory :charge do
    created { Time.parse(Faker::Time.between(from: 1.years.ago, to: DateTime.now, format: :long)).to_i }
    paid { false }
    amount { Faker::Number.between(from: 10, to: 10_000) }
    refunded { false }
    currency { 'usd' }
    association :customer, factory: :customer, strategy: :build
  end
end
