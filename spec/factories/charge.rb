FactoryBot.define do
  factory :charge do
    amount { 100 }
    currency { 'usd' }
    customer
  end
end
