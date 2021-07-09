FactoryGirl.define do
  factory :customer do
    sequence(:first_name){|n| "FirstName_#{n}"}
    sequence(:last_name){|n| "LastName_#{n}"}
  end

  factory :charge do
    sequence(:created) { 12121 }
    sequence(:paid){ true }
    sequence(:amount){5431}
    sequence(:currency){'usd'}
    sequence(:refunded){false}
  end
end