require 'rails_helper'

describe "Charges lists", type: :feature do
  before do
    load "#{Rails.root}/db/seeds.rb"
    visit root_path
  end

  describe 'screen should have three transaction lists' do
    
    it 'should have successful transactions list' do
      expect(page).to have_content 'Successfull Transactions'
    end
    
    it 'should have failed transaction list' do
      expect(page).to have_content 'Failed Transactions'
    end
    it 'should have disputed transaction list' do
      expect(page).to have_content 'Disputed Transactions'
    end
    
    it 'disputed transaction list should have 5 items' do
      page.has_css?("tr.disputed", count: 5)
    end
    
    it 'failed transaction list should have 5 items' do
      page.has_css?("tr.falied", count: 5)
    end

    it 'successful transaction should have 10 items' do
      page.has_css?("tr.successful", count: 10)
    end
    
    
  end
end