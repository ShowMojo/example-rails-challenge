FactoryGirl.define do
  factory :charge do
    paid 'true'
    refunded 'false'
    customer_id 1
    amount 78.6
    currency "usd"
  end

  factory :customer do
    first_name "John"
    last_name "Smith"
  end

end
