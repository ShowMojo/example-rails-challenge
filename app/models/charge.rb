class Charge < ApplicationRecord
  belongs_to :customer

  def failed?
    !paid?
  end

  def disputed?
    refunded?
  end

  def successful?
    paid? && !refunded?
  end
end
