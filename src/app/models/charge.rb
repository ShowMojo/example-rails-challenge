class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :amount, :currency, presence: true

  enum state: %i[success failed disputed]
end
