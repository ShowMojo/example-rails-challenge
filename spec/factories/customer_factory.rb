# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
factory :customer do
  first_name { Faker::Name.first_name }
  title { Faker::Name.last_name }
end
