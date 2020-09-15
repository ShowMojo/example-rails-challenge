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
class Charge < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :customer
end
