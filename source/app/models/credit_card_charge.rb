class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> {where(paid:true, refunded:true)}
  scope :failed, -> {where(paid:false, refunded:false)}
  scope :disputed, -> {where(paid:true, refunded:false)}
end
