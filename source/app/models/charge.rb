class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }
  scope :failed, -> { where(paid: false) }
end
