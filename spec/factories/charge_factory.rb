# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  paid        :boolean
#  amount      :float
#  currency    :string
#  refunded    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :charge do
    customer
    paid { true }
    amount { rand(9..99) }
    currency { 'usd' }
    refunded { false }
  end
end
