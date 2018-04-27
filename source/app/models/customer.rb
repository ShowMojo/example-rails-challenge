class Customer < ActiveRecord::Base
  has_many :credit_card_charges

  def name
    [first_name, last_name].compact.join(' ')
  end
end
