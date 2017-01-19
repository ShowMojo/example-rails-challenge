class Customer < ApplicationRecord
  has_many :charges, dependent: :destroy
end
