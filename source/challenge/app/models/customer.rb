class Customer < ActiveRecord::Base

  has_many :charges

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  def full_name
    "#{first_name} #{last_name}"
  end
  alias_method :name, :full_name
end
