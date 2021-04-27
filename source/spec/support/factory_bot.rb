RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

def seed_db
  FactoryBot.create(:customer) do |c|
    FactoryBot.create_list(:charge, 5, :successful, customer: c)
    FactoryBot.create_list(:charge, 1, :disputed, customer: c)
  end

  FactoryBot.create(:customer, first_name: 'Raj', last_name: 'Jamnis') do |c|
    FactoryBot.create_list(:charge, 3, :successful, customer: c)
    FactoryBot.create_list(:charge, 2, :disputed, customer: c)
  end

  FactoryBot.create(:customer, first_name: 'Andrew', last_name: 'Chung') do |c|
    FactoryBot.create(:charge, :successful, customer: c)
    FactoryBot.create_list(:charge, 3, :failed, customer: c)
  end

  FactoryBot.create(:customer, first_name: 'Mike', last_name: 'Smith') do |c|
    FactoryBot.create(:charge, :successful, customer: c)
    FactoryBot.create_list(:charge, 2, :failed, customer: c)
  end
end
