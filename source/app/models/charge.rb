class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :created, :paid, :amount, :currency, presence: true
end
