class Charge < ActiveRecord::Base
  include ActiveModel::Serializers::JSON

  belongs_to :customer

  validates :created, :amount, :currency, :customer_id, presence: true
end
