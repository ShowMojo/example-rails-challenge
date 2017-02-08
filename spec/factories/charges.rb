FactoryGirl.define do
  factory :charge do
    amount { rand(9999) }
    currency 'USD'
    paid true
    refunded false

    customer
  end

  factory :successfull, parent: :charge do
    paid     true
    refunded false
  end

  factory :failed, parent: :charge do
    paid     false
    refunded false
  end

  factory :disputed, parent: :charge do
    paid     true
    refunded true
  end
end
