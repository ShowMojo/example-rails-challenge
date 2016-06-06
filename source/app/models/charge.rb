class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :succeeded, -> { where paid: true, refunded: false }
  scope :failed, -> { where paid: true, refunded: true }
  scope :disputed, -> { where paid: false, refunded: true }
end
