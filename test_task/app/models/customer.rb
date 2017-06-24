class Customer < ActiveRecord::Base
  has_many :charges, dependent: :nullify
end
