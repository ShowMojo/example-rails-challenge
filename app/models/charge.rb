class Charge < ApplicationRecord
  belongs_to :customer

  enum currency: [:usd, :euro]

  validates_presence_of :created, :amount, :currency, :customer_id
end
