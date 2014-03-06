# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charge do
    paid false
    created "2014-03-06 23:16:32"
    amount 1
    currency "MyString"
    refunded false
    customer nil
  end
end
