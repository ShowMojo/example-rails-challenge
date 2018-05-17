require "rails_helper"

RSpec.describe 'Charges', type: :feature do

  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end

  before do
    load_seeds
    visit root_path
  end

  describe '#index page' do
    it 'contains list of successful charges' do
      expect(page).to have_css('table.successful-items')
    end

    it 'contains list of failed charges' do
      expect(page).to have_css('table.failed-items')
    end

    it 'contains list of disputed charges' do
      expect(page).to have_css('table.disputed-items')
    end

    it 'contains 10 successful charges in the list' do
      within '#charges-section' do
        rows = find('table.successful-items').all('tr.item')
        expect(rows.count).to eq 10
      end
    end

    it 'contains 5 failed charges in the list' do
      within '#charges-section' do
        rows = find('table.failed-items').all('tr.item')
        expect(rows.count).to eq 5
      end
    end

    it 'contains 5 disputed charges in the list' do
      within '#charges-section' do
        rows = find('table.disputed-items').all('tr.item')
        expect(rows.count).to eq 5
      end
    end
  end

end