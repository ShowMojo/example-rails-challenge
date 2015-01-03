class Charge < ActiveRecord::Base
	belongs_to :customer

	validates :amount, numericality: true
	validates :customer, :amount, :currency, presence: true
	validates :currency, inclusion: {in: ['USD']}

	scope :succeed,  -> { where(paid: true, refunded: false)  }
	scope :failed,   -> { where(paid: false, refunded: false) }
	scope :disputed, -> { where(paid: true, refunded: true)   }

	def created
		created_at
	end
end