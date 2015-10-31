class Charge < ActiveRecord::Base
  monetize :amount_cents
  enum status: %i(successful disputed failed)
  belongs_to :customer
end
