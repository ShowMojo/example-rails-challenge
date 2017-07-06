class Charge < ActiveRecord::Base
  belongs_to :customer
  scope :succeed, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  validates :amount, presence: true
end
