class Customer < ApplicationRecord
  has_many :charges, dependent: :restrict_with_exception
end