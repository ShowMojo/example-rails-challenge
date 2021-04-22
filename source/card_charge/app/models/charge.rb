class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :failed, -> { where(paid: false) }
  scope :paid, -> { where(paid: true)}
  scope :success, -> { paid.where(refunded: false) }
  scope :disputed, -> { where(refunded: true) }
end
