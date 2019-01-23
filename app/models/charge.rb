class Charge < ApplicationRecord
  belongs_to :customer

  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :successful, -> { where(paid: true, refunded: false) }

  def created
    created_at
  end

  def amount_to_dolar
    amount / 100.0
  end
end
