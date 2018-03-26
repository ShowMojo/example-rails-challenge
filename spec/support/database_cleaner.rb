RSpec.configure do |config|
  config.use_transactional_fixtures = false

  DatabaseCleaner[:active_record].strategy = :truncation

  # config.before(:each) do
    # DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
  config.before(:all) do
    load "#{Rails.root}/db/seeds.rb"
  end

  # config.before(:all) do
    # DatabaseCleaner.start
  # end

  config.after(:all) do
    DatabaseCleaner.clean
  end

end
