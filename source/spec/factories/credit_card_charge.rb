FactoryGirl.define do
  factory :successful_charge, class:CreditCardCharge do
    paid true
    amount 3500.00
    currency "USD"
    refunded true
    customer
  end

  factory :failed_charge, class:CreditCardCharge do
    paid false
    amount 3500.00
    currency "USD"
    refunded false
    customer
  end

  factory :disputed_charge, class:CreditCardCharge do
    paid true
    amount 3500.00
    currency "USD"
    refunded false
    customer
  end

end