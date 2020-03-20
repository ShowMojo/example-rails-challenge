class Charge < ActiveRecord::Base
  validates  :amount,   presence: true
  validates  :customer, presence: true

  belongs_to :customer

  scope :successful, -> { includes(:customer).where(paid: true,  refunded: false) }
  scope :failed,     -> { includes(:customer).where(paid: false, refunded: false) }
  scope :disputed,   -> { includes(:customer).where(paid: true,  refunded: true)  }

  delegate :name, to: :customer, prefix: true

  def customer_name
    customer.name
  end

  def display_amount
    "#{amount} #{currency}"
  end
end
