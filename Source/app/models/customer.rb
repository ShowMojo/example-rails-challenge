class Customer < ActiveRecord::Base
  has_many :charges

  validates :first_name, presence: true, uniqueness: { scope: [:last_name] }

  def name
    "#{first_name} #{last_name}"
  end
end