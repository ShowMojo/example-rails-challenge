FactoryBot.define do
  factory :charge do
    created { "2021-05-31 15:50:15" }
    paid { false }
    amount { "" }
    currency { "MyString" }
    refunded { false }
    customer_id { "" }
  end
end
