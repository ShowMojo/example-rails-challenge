class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where('refunded is ? AND paid is ?', false, false).includes(:customer) }
  scope :successful, -> { where('refunded is ? AND paid is ?', false, true).includes(:customer) }
  scope :disputed, -> { where('refunded is ? AND paid is ?', true, true).includes(:customer) }
end
