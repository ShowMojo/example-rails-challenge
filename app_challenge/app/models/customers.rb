class Customers < ActiveRecord::Base
  has_many :card_charges
end
