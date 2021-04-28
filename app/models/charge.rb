class Charge < ApplicationRecord
  belongs_to :customer

  validates_presence_of :amount, :currency, :customer_id

  scope :successful, -> { where(paid: true).where(refunded: false) }
  scope :disputed, -> { where(paid: true).where(refunded: true) }
  scope :failed, -> { where(paid: false) }
end
