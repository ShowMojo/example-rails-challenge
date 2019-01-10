class Customer < ActiveRecord::Base
  has_many :charges, dependent: :delete_all
end
