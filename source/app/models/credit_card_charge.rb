class CreditCardCharge < ActiveRecord::Base
  enum currency: { usd: 0, eur: 1, rur: 2 }

  def self.currencies_for_select
    currencies.map { |c, _| c }
  end
end
