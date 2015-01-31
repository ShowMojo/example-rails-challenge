class Customer < ActiveRecord::Base
  has_many :card_charges
end
