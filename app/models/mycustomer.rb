class Mycustomer < ActiveRecord::Base
	validates :firstName, presence: true
	has_many :transactions, dependent: :destroy
end
