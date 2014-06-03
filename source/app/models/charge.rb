class Charge < ActiveRecord::Base

	validates :paid, :presence => true
	validates :amount, :presence => true
	validates :currency, :presence => true
	validates :refunded, :presence => true

	belongs_to :customer
end
