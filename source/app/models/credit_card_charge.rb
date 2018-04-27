class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :paid,     -> { where(paid: true, refunded: false) }
  scope :failed,   -> { where(paid: false) }
  scope :disputed, -> { where(paid: false) }

  delegate :name, to: :customer

  def human_amount
    amount / 100
  end
end
