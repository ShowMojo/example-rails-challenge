class Customer < ActiveRecord::Base
  has_many :charges
  validates :first_name, :last_name, presence: true
  validates_associated :charges

end
