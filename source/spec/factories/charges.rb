#Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charge do
    amount 4900
    currency 'usd'
    paid true
    refunded false
    customer
  end
end
