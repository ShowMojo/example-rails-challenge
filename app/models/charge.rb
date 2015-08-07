class Charge < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper

	belongs_to :customer
	enum currency: [:usd, :eur, :uah]

	scope :successfull, -> { where(paid: true, refunded: false).sort_by(&:created_at) }
	scope :failed, -> { where(paid: false, refunded: false).sort_by(&:created_at) }
	scope :disputed, -> { where(paid: true, refunded: true).sort_by(&:created_at) }

	def human_amount
		case self.currency
			when "usd"
				number_to_currency(self.amount/100, :unit => "$")
			when "eur"
				number_to_currency(self.amount/100, :unit => "€")
			when "uah"
				number_to_currency(self.amount/100, :unit => "₴")
		end
	end

end
