class Charge < ActiveRecord::Base
	enum status: [:successfull, :failed, :disputed]

	belongs_to :customer

	scope :by_status, -> status { where(status: status) }
end
