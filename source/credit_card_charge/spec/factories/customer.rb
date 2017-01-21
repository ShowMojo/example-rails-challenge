FactoryGirl.define do
  factory :customer do
    first_name  FFaker::Name.first_name
    last_name   FFaker::Name.last_name


    trait(:with_paid_charges) do
      transient do
        charges_count 3
      end

      after(:build) do |customer, evaluator_|
        customer.charges_count.each do ||
          customer.charges << build(:charge, :paid)
        end
      end
    end

    trait(:with_refunded_charges) do
      transient do
        charges_count 3
      end

      after(:build) do |customer, evaluator_|
        customer.charges_count.each do ||
          customer.charges << build(:charge, :refunded)
        end
      end
    end
  end
end

