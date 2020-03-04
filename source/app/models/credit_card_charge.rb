class CreditCardCharge < ApplicationRecord
  belongs_to :customer

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(refunded: true) }

  enum currency: [:usd, :mxn, :gbp]

  def amount_in_cents
    (amount * 100).to_i
  end
end
