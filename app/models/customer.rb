class Customer < ActiveRecord::Base

	has_many :charges

	def name
		"#{self.first_name.capitalize} #{self.last_name.capitalize}"
	end
	
end
