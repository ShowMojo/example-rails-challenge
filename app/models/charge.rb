class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where('refunded is ? AND paid is ?', false, false) }
  scope :successful, -> { where('refunded is ? AND paid is ?', false, true) }
  scope :disputed, -> { where('refunded is ? AND paid is ?', true, true) }
end
