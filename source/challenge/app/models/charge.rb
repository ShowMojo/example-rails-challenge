class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, :currency, :customer, presence: true
  validates :amount, numericality: true
  validates :currency, inclusion: { in: ['usd'] }

  scope :successful, -> { where(paid: true, refunded: false) }
  scope :failed,     -> { where(paid: false, refunded: false) }
  scope :disputed,   -> { where(paid: true, refunded: true) }

  def created
    created_at
  end

  def failed?
    !paid && !refunded
  end

  def disputed?
    paid && refunded
  end

end
