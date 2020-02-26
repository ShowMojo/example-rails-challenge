# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  paid        :boolean
#  amount      :integer
#  currency    :string
#  refunded    :boolean
#  customer_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Charge < ApplicationRecord
  belongs_to :customer
end
