FactoryBot.define do
  factory :charge do
    amount { 4900 }
    currency { 'usd' }
    customer
  end
end
