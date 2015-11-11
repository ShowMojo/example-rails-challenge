FactoryGirl.define do
  factory :customer do
    sequence(:first_name)  { |n| "FirstName #{n}" }
    sequence(:last_name)  { |n| "LastName #{n}" }

  end

end
