class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :created, :amount, :currency, presence: true
end
