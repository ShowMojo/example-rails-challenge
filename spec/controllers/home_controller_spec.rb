require 'rails_helper'

RSpec.describe HomeController, type: :feature do

  def run_seeds
    load "#{Rails.root}/db/seeds.rb"
  end

  before do
    run_seeds
    visit '/'
  end

  describe "#index" do
    it 'contains list of successful transactions' do
      expect(page).to have_css('table.successful')
    end

    it 'contains list of disputed transactions' do
      expect(page).to have_css('table.disputed')
    end

    it 'contains list of failed transactions' do
      expect(page).to have_css('table.failed')
    end

    it 'contains 10 successful transactions in the list' do
      within '#nav-tabContent' do
        rows = find('table.successful').all('tbody tr')
        expect(rows.count).to eq 10
      end
    end

    it 'contains 5 disputed transactions in the list' do
      within '#nav-tabContent' do
        rows = find('table.disputed').all('tbody tr')
        expect(rows.count).to eq 5
      end
    end

    it 'contains 5 failed transactions in the list' do
      within '#nav-tabContent' do
        rows = find('table.failed').all('tbody tr')
        expect(rows.count).to eq 5
      end
    end
  end
end
