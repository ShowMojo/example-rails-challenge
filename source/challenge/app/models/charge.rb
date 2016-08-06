class Charge < ActiveRecord::Base

  belongs_to :customer

  monetize :amount_cents, allow_nil: false, numericality: { greater_than_or_equal_to: 0 }

  validates :customer, presence: true
  validates :currency, presence: true, inclusion: { in: %w(usd) }
  validates :paid, :refunded, inclusion: { in: [true, false] }

  scope :successful,  -> { where(paid: true, refunded: false) }
  scope :failed,      -> { where(paid: false) }
  scope :disputed,    -> { where(refunded: true) }
end
