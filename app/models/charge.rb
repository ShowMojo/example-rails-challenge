class Charge < ApplicationRecord
  belongs_to :customer
  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: true) }
  scope :disputed, -> { where(paid: false, refunded: false) }
end
