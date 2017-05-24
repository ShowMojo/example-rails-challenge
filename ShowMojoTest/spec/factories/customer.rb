FactoryGirl.define do
  factory :customer do
    sequence(:first_name) {|n| "customer#{n}"}
    sequence(:last_name) {|n| "customer#{n}"}
  end
end
