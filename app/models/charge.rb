class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, :currency, presence: true

  delegate :full_name, to: :customer
end
