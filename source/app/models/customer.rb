class Customer < ActiveRecord::Base
    has_many :credit_card_charge

    def name
        "#{first_name} #{last_name}"
    end
end
