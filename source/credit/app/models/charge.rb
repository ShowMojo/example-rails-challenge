class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful_transactions, -> { where(paid: true, refunded: false) }
  scope :failed_transactions, -> { where(paid: false)}
  scope :disputed_transactions, -> { where(paid: true, refunded: true) }
end
