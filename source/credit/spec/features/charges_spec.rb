require "rails_helper"

feature "Credit card charges" do
  scenario "Verify three list on screen" do
    visit "/charges"
    expect(page).to have_selector('div.list1')
    expect(page).to have_selector('div.list2')
    expect(page).to have_selector('div.list3')

    within '.list1' do
      expect(page).to have_content('Failed charges')
    end
    within '.list2' do
      expect(page).to have_content('Disputed charges')
    end
    within '.list3' do
      expect(page).to have_content('Successful charges')
    end
  end


end