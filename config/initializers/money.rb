MoneyRails.configure do |config|
  config.default_currency = :usd
  Money.locale_backend = :currency
end
