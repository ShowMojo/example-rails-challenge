class Charge < ApplicationRecord

  belongs_to :customer

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def self.create_charge(customer_id, paid=true, refunded=false)
    Charge.find_or_create_by(
      created: Time.now.to_i,
      paid: paid,
      amount: (rand * 50).round(2),
      customer_id: customer_id,
      refunded: refunded
    )
  end
end
