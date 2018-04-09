class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true, paid: true) }
  scope :successful, -> { where(paid: true) }

end
