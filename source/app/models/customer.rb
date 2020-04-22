# frozen_string_literal: true

# Customer model
class Customer < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
end
