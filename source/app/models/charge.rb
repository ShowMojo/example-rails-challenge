class Charge < ApplicationRecord
  belongs_to :customer

  enum status: [:successful, :failed, :disputed]
  
  scope :successful, -> { where(:status => :successful)}

  scope :failed, -> { where(:status => :failed)}
  
  scope :disputed, -> { where(:status => :disputed)}
end
