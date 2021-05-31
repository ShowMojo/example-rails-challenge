class Charge < ApplicationRecord
  validates :created, presence: true
  validates :amount, presence: true
  validates :currency, presence: true
  validates :customer_id, presence: true
  validates :paid, inclusion: {in: [true, false]}
  validates :refunded, inclusion: {in: [true, false]}

  belongs_to :customer
end
