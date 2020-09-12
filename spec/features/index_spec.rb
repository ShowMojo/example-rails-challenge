# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Root page' do
  scenario 'User loads a root page' do
    visit(root_path)

    expect(page).to have_selector('table', count: 3)

    expect(page).to have_selector('.failed_charges_list', count: 1)
    expect(page).to have_selector('.disputed_charges_list', count: 1)
    expect(page).to have_selector('.successful_charges_list', count: 1)

    expect(page).to have_selector('.successful_charges', count: 10)
    expect(page).to have_selector('.failed_charges', count: 5)
    expect(page).to have_selector('.disputed_charges .failed', count: 5)
  end
end
