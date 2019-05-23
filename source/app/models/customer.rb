class Customer < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :transactions, dependent: :destroy
    
    def full_name
        [first_name, last_name].join(' ')
    end
end
