class Charge < ActiveRecord::Base
	belongs_to :customer
	scope :failed_transaction, -> { where(paid: false) }
  	scope :disputed_transaction, -> { where(paid: true, refunded: true) }
  	scope :successful_transaction, -> { where(paid: true, refunded: false) }
end
