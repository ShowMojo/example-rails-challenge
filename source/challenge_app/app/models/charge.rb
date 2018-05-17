class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount,
            presence: true,
            numericality: true
  validates :currency,
            presence: true
  validates :customer_id,
            presence: true,
            numericality: {only_integer: true}
  validates :paid,
            inclusion: { in: [true, false] }

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def amount_in_cents
    (amount * 100).to_i
  end

  def created
    created_at.to_i
  end
end
