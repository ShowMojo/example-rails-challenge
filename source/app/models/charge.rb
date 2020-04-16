class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :created, :paid, :amount, :currency, :refunded, presence: true
end
