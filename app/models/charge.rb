class Charge < ActiveRecord::Base
  belongs_to :customer
  before_create :set_created

  def set_created
    self.created = rand(1389618241..1399618241)
  end

end
