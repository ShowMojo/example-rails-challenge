class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer

  scope :successful, -> {where(paid: true, refunded: false)}
  scope :failed, -> {where(paid: false)}
  scope :disputed, -> {where(paid: true, refunded: true)}

  def date
    self.created_at.strftime("%F")
  end
end
