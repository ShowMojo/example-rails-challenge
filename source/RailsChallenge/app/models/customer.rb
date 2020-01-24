class Customer < ActiveRecord::Base
  has_many :transactions
  validates :first_name, :last_name, presence: true


  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
