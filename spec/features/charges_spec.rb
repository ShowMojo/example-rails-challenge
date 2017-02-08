require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before :each do
    # successful
    10.times { create(:successfull) }

    # failed
    5.times { create(:failed) }

    # disputed
    5.times { create(:disputed) }

    visit root_path
  end

  it 'render three types of charges' do
    expect(page).to have_css('h1', text: 'Successfull charges')
    expect(page).to have_css('h1', text: 'Failed charges')
    expect(page).to have_css('h1', text: 'Disputed charges')
  end

  it 'render correct successful charges rows count' do
    within('.table-successful') do
      expect(page).to have_selector('tr.success', count: 10)
      expect(page).to have_selector('tr.success', count: Charge.successfull.count)
    end
  end

  it 'render correct failed charges rows count' do
    within('.table-failed') do
      expect(page).to have_selector('tr.failed', count: 5)
      expect(page).to have_selector('tr.failed', count: Charge.failed.count)
    end
  end

  it 'render correct disputed charges rows count' do
    within('.table-disputed') do
      expect(page).to have_selector('tr.disputed', count: 5)
      expect(page).to have_selector('tr.disputed', count: Charge.disputed.count)
    end
  end
end
