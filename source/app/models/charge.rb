class Charge < ActiveRecord::Base
  belongs_to :customer

  def self.new_random_payment(attributes)
    new(attributes.merge(amount: rand(1000_00) + 1, currency: %w(usd eur rub chf gbp).sample))
  end

  def refund!
    update!(refunded: true)
  end

  def successful?
    paid and not refunded
  end

  def disputed?
    paid and refunded
  end

  def failed?
    not paid
  end
end
