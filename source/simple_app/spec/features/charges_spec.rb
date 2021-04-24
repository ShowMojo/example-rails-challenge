require 'rails_helper'

RSpec.feature 'Charges', type: :feature do
  before do
    Rails.application.load_seed
  end

  it 'should list three lists ' do
    visit '/charges'

    expect(page).to have_css('ul', count: 3)
  end

  it 'should have successful charges list with 10 items ' do
    visit '/charges'

    expect(page).to have_css('ul.successful_charges li', count: 10)
  end

  it 'should have failed charges list with 5 items ' do
    visit '/charges'

    expect(page).to have_css('ul.failed_charges li', count: 5)
  end

  it 'should have disputed charges list has items ' do
    visit '/charges'

    expect(page).to have_css('ul.disputed_charges li', minimum: 1)
  end
end
