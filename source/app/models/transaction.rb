class Transaction < ApplicationRecord
  belongs_to :customer
  
  enum status: [:successful, :failed, :disputed]
end
