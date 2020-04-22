# frozen_string_literal: true

# Customer credit card charge model
class CreditCardCharge < ActiveRecord::Base
  DEFAULT_CURRENCY = 'USD'

  belongs_to :customer
  validates :customer, :amount, :currency, presence: true
  validates :refunded, :paid, inclusion: {in: [true, false]}

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :disputed, -> { where(refunded: true) }
  scope :failed, -> { where(paid: false) }

  def format_amount
    sprintf('%.2f %s', self[:amount].to_f / 100, currency)
  end
end
