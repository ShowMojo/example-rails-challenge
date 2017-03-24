class Charge < ApplicationRecord
  belongs_to :customer

  def self.failed
    where(paid: false, refunded: false)
  end

  def self.disputed
    where(paid: true, refunded: true)
  end

  def self.successful
    where(paid: true, refunded: false)
  end
end
