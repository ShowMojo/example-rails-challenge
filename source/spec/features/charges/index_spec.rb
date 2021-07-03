require 'rails_helper'

RSpec.feature 'index' do
  scenario 'index' do
    visit(root_path)

    # Check presence of 3 lists
    expect(page).to have_selector('table', count: 3)

    # Check presence of each list
    expect(page).to have_selector('.successful-list', count: 1)
    expect(page).to have_selector('.failed-list', count: 1)
    expect(page).to have_selector('.disputed-list', count: 1)

    # Check number of items in each list
    expect(page).to have_selector('.successful', count: 10)
    expect(page).to have_selector('.failed', count: 5)
    expect(page).to have_selector('.disputed', count: 5)
  end
end