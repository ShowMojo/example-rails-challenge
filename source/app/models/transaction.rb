class Transaction < ActiveRecord::Base
  belongs_to :customer

  validates :amount, presence: true, numericality: { only_integer: true }

  scope :failed_charges, -> { where(paid: false) }
  scope :disputed_charges, -> { where(refunded: true) }
  scope :successful_charges, -> { where(paid: true).where.not(refunded: true) }

  def amount_in_dollars
    amount / 100.0
  end
end
