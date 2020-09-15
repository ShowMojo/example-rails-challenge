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

  validates_presence_of :customer, :amount

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
end
