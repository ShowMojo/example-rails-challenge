class Customer < ActiveRecord::Base
	has_many :charges

	def fullname
		unless self.firstname.nil? || self.lastname.nil?
			"#{self.firstname}  #{self.lastname}"
		end
	end
end
