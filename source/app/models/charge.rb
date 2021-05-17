class Charge < ApplicationRecord
  belongs_to :customer

  scope :success, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }
end
