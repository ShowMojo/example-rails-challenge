class Charge < ActiveRecord::Base
  scope :successfull, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }

  belongs_to :customer

  def amount_in_usd
    amount/100
  end
end
