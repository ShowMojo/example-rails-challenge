class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, presence: true
  validates :customer, presence: true

  scope :failed,  -> { where(paid: false) }
  scope :disputed,  -> { where(refunded: true) }
  scope :successful,  -> { where(refunded: false, paid: true) }

end
