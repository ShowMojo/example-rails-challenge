class Customer < ActiveRecord::Base
	has_many :charge
end
