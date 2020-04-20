FactoryBot.define do
  factory :charge do
    amount { rand(100..10_000) }

    customer

    factory :failed_charge do
      status { :failed }
    end

    factory :successful_charge do
      status { :successful }
    end

    factory :disputed_charge do
      status { :disputed }
    end
  end
end
