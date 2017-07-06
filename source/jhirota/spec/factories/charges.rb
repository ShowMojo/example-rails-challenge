FactoryGirl.define do
  factory :charge do
    customer 1
    paid true
    amount 1
    currency "us"
    refunded false
  end
end
