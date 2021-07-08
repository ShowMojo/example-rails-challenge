class CreditCardOperation < ActiveRecord::Base
  belongs_to :user

  def self.successful
    where(paid: true, refunded: false)
  end

  def self.disputed
    where(paid: true, refunded: true)
  end

  def self.failed
    where(paid: false)
  end
end
