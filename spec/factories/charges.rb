FactoryGirl.define do
  factory :charge do
    paid false
    amount 1
    currency "MyString"
    refunded false
    customer nil
  end
end
