FactoryBot.define do
  factory :customer do
    first_name {"Generic"}
    last_name {"Customer"}
  end
  factory :charge do
    created {Time.now.to_i}
    paid {true}
    amount {10_000}
    currency {"usd"}
    refunded {false}

    customer

    trait :failed do
      paid {false}
    end

    trait :disputed do
      refunded {true}
    end
  end
end
