class Customer < ActiveRecord::Base
  has_many :transactions

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
