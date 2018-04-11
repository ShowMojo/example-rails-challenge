require 'rails_helper'

RSpec.describe 'card_transactions', type: :view do
  before(:all) do
    load "#{Rails.root}/db/seeds.rb"
  end

  subject { page }

  describe 'charges' do
    before do
      visit charges_path
    end

    it { should have_selector('h1', text: 'Failed Charges') }
    it { should have_selector('h1', text: 'Disputed Charges') }
    it { should have_selector('h1', text: 'Successful Charges') }
    it { should have_selector('li.failed', count: 5) }
    it { should have_selector('li.disputed', count: 5) }
    it { should have_selector('li.successful', count: 10) }
  end

  after(:all) do
    DatabaseCleaner.clean
  end
end
