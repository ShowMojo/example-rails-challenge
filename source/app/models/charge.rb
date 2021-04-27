class Charge < ApplicationRecord
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :successful, -> { where(paid: true).where.not(refunded: true) }
  scope :disputed, -> { where(refunded: true) }

  delegate :customer_name, to: :customer
end
