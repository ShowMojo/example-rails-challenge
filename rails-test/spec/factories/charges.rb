FactoryGirl.define do
  factory :charge do
    association :customer, factory: :customer
    paid true
    amount 1
    refunded false

    factory :failed_charge do
      paid false
    end

    factory :disputed_charge do
      refunded true
    end

  end


end
