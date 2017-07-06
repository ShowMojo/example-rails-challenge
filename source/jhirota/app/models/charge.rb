class Charge < ActiveRecord::Base
  belongs_to :customer
  scope :succeed, -> { where(paid: true) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(refunded: true) }

  validates :amount, presence: true
end
