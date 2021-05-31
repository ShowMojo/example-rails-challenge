FactoryBot.define do
  factory :customer do
    first_name { |n| "First Name #{n}" }
    last_name { |n| "Last Name #{n}" }
  end
end
