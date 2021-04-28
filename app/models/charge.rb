class Charge < ApplicationRecord
  USD_CURRENCY = 'USD'.freeze

  belongs_to :customer
end