class Customer < ActiveRecord::Base
  has_many :credit_card_charges

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
