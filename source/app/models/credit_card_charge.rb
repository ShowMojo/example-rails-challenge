class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer
  enum status: [:failed, :successful, :disputed]
end
