FactoryBot.define do
  factory :customer do
    first_name { 'John' }
    last_name { 'Doe' }
  end

  factory :charge do
    association :customer
  end
end