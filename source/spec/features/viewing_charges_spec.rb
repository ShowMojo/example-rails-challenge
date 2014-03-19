require 'spec_helper'

describe 'Charges index', type: :feature do
  context 'successfull, failed and disputed charges present' do
    before do
      load "#{Rails.root}/db/seeds.rb"
      visit root_path
    end

    it 'should have three lists of charges' do
      print page.html
      expect(page).to have_css(".successful .charges")
      expect(page).to have_css(".failed .charges")
      expect(page).to have_css(".disputed .charges")
    end

    describe 'Successful list' do
      it 'should have 10 items' do
        within(".successful .charges") do
          expect(page).to have_css("tr", count: 10)
        end
      end
    end

    describe 'Failed list' do
      it 'should have 5 items' do
        within(".failed .charges") do
          expect(page).to have_css("tr", count: 5)
        end
      end
    end

    describe 'Disputed list' do
      it 'should have at least one item' do
        within(".disputed .charges") do
          expect(page).to have_css("tr")
        end
      end
    end
  end
end
