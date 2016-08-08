require 'database_cleaner'
require 'factory_girl'
require 'faker'
require 'simplecov'
require 'support/factory_girl'
require 'rspec/active_model/mocks'

SimpleCov.start 'rails'

DatabaseCleaner[:active_record].strategy = :transaction
DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before :each do
    Rails.cache.clear
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.around do |example|
    Timeout.timeout(30, &example)
  end
end