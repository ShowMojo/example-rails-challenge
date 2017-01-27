class Customer < ActiveRecord::Base
	has_many :charges
 
  validates_presence_of :first_name, :last_name
  
  def full_name
		"#{first_name} #{last_name}"
  end
end
