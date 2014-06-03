class Charge < ActiveRecord::Base

	validates :amount, :presence => true
	validates :currency, :presence => true

	belongs_to :customer

	scope :successful_charges, -> { where(paid: true, refunded: false) }
	scope :failed_charges, -> { where(paid: false, refunded: false) }
	scope :disputed_charges, -> { where(paid: true, refunded: true) }
	
end
