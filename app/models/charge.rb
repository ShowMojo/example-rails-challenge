class Charge < ApplicationRecord
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :succeed, -> { where(paid: true, refunded: false) }
end
