class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }

  def printable_amount
    (amount / 100.0).to_s + ' ' + currency
  end
end
