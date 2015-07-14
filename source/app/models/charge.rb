# == Schema Information
#
# Table name: charges
#
#  id          :integer          not null, primary key
#  paid        :boolean          default(FALSE)
#  amount      :float
#  currency    :string(3)        default("USD")
#  refunded    :boolean          default(FALSE)
#  customer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_charges_on_customer_id  (customer_id)
#

class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
end
