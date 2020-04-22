# frozen_string_literal: true

# Customer model
class Customer < ActiveRecord::Base
  has_many :credit_card_charges
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
