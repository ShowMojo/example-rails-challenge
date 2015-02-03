class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :customer, :amount, :currency, presence: true

  def created
    created_at.to_i
  end

  def successful?
    paid && !refunded
  end

  def failed?
    !paid && !refunded
  end

  def disputed?
    paid && refunded
  end

end
