class Charge < ApplicationRecord
  belongs_to :customer

  scope :successful, -> {
    where(paid: true)
  }

  scope :failed, -> {
    where(paid: false).where.not(refunded: true)
  }

  scope :disputed, -> {
    where(refunded: true)
  }

end