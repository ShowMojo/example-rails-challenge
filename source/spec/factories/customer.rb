FactoryGirl.define do
  sequence :first_name do |n|
    "#{n}"
  end

  sequence :last_name do |n|
    "#{n}"
  end

  factory :customer do
    first_name
    last_name
  end
end