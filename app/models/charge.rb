class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, :currency, presence: true

  delegate :full_name, to: :customer

  def amount_in_dollars
    amount / 100
  end

  def failed?
    paid == false
  end
end
