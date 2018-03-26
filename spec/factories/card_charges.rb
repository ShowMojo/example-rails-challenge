# == Schema Information
#
# Table name: card_charges
#
#  id          :integer          not null, primary key
#  created     :datetime
#  paid        :boolean
#  amount      :float
#  currency    :string
#  refunded    :boolean
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :card_charge do
    created "2018-03-26 11:24:38"
    paid false
    amount 1.5
    currency "MyString"
    refunded false
    customer nil
  end
end
