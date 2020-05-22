class Charge < ActiveRecord::Base
  belongs_to :customer
  validates :customer, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :currency, presence: true, inclusion: { in: %w(usd) }
  validates :paid, :refunded, inclusion: { in: [true, false] }

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed,  -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }
end
