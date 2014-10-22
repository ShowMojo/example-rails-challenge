class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }
  scope :successed, -> { where(paid: true, refunded: false) }
end
