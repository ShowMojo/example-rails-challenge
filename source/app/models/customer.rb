class Customer < ActiveRecord::Base
  has_many :charges, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
