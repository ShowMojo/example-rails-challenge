class Customer < ActiveRecord::Base
	has_many :charges

	def fullname
		"#{firstname} #{lastname}"
	end
end
