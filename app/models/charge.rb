class Charge < ActiveRecord::Base
  belongs_to :customer, required: true

  validates :amount, :currency, presence: true

  scope :successfull, -> { where(paid: true, refunded: false) }
  scope :failed, -> { where(paid: false, refunded: false) }
  scope :disputed, -> { where(paid: true, refunded: true) }

  def humanized_amount
    "#{amount.to_f / 100} #{currency}"
  end
end
