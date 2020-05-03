# frozen_string_literal: true

# Charges related business logic
class Charge < ActiveRecord::Base
  belongs_to :customer

  enum currency: { usd: 0, inr: 1, eur: 2, gbp: 3 }

  validates :customer, presence: true
  validates :amount, presence: true
  validates :currency, inclusion: { in: currencies.keys }

  scope :successful, -> { where(paid: true,  refunded: false) }
  scope :failed,     -> { where(paid: false, refunded: false) }
  scope :disputed,   -> { where(paid: true,  refunded: true) }
end
