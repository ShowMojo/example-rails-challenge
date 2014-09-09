require 'rails_helper'

describe "Charges lists", type: :feature do
  before do
    load "#{Rails.root}/db/seeds.rb"
    visit root_path
  end

  describe 'have three lists on the screen' do
    it 'have successful list' do
      expect(page).to have_content 'Successful Charges'
    end
    it 'have failed list' do
      expect(page).to have_content 'Failed Charges'
    end
    it 'have disputed list' do
      expect(page).to have_content 'Disputed Charges'
    end

    it 'successful list have 10 items' do
      within('.successful') do
        expect(page).to have_css('tr', count: 10)
      end
    end
    it 'failed list have 5 items' do
      within('.failed') do
        expect(page).to have_css('tr', count: 5)
      end
    end
    it 'disputed list have 5 items' do
      within('.disputed') do
        expect(page).to have_css('tr', count: 5)
      end
    end
  end
end