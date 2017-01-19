class Charge < ApplicationRecord
  belongs_to :customer

  scope :succeed, -> { where paid: true, refunded: false }
  scope :failed, -> { where paid: false }
  scope :disputed, -> { where paid: true, refunded: true }

  monetize :amount, as: :money_amount
end
