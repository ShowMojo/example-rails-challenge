class Charge < ActiveRecord::Base
  belongs_to :customer
  before_create :set_created
  
  
  def formatted_customer_name
    @customer = Customer.find(self.customer_id)
    return @customer.first_name + " " + @customer.last_name
  end

  def set_created
    self.created = rand(1389618241..1399618241)
  end

end
