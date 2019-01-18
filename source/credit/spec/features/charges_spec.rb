require "rails_helper"

feature "Credit card charges" do
  scenario "Verify three list on screen" do
    visit "/charges"
    expect(page).to have_selector('div.list.failed')
    expect(page).to have_selector('div.list.disputed')
    expect(page).to have_selector('div.list.success')

    within '.success' do
      expect(page).to have_content('Successful charges')
      expect(all('tr').count).to eq 10
    end

    within '.failed' do
      expect(page).to have_content('Failed charges')
      expect(all('tr').count).to eq 5
    end
    within '.disputed' do
      expect(page).to have_content('Disputed charges')
      expect(all('tr').count).to eq 5
    end
  end
end
