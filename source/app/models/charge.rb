class Charge < ApplicationRecord
  belongs_to :customer

  scope :paid, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where.not(paid: true) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  # TODO:
  #   This should be in decorator and presenter side.
  #   It should support currency as well,
  def amount_display
    amount / 100.0
  end
end
