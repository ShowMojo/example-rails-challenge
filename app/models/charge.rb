# frozen_string_literal: true

class Charge < ActiveRecord::Base
  belongs_to :customer

  enum currency: [:usd, :inr, :eur, :gbp]

  validates :customer, presence: true
  validates :amount, presence: true
  validates :currency, inclusion: { in: currencies.keys }

end
