class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { where("paid = ? AND refunded = ?", true, false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }
end
