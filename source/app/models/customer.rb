class Customer < ActiveRecord::Base
  has_many :charges

  validates :first_name, uniqueness: { scope: [:last_name] }

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
