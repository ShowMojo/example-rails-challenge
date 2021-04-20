class CreditCard < ActiveRecord::Base
  belongs_to :customer
end
