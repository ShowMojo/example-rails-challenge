FactoryGirl.define do
  factory :credit_card_charge do
    amount_cents    { rand(10000) }
    paid      true
    refunded  false
    customer
  end
  
  factory :successful, parent: :credit_card_charge do
    paid      true
    refunded  false
  end
  
  factory :failed, parent: :credit_card_charge do
    paid      false
    refunded  false
  end

  factory :disputed, parent: :credit_card_charge do
    paid      true
    refunded  true
  end
end