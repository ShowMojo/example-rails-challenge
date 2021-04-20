require "rails_helper"

RSpec.feature "Charges index", :type => :feature do
  before(:each) do
    visit "/charges/"
  end

  describe "User visits the index page of the transactions" do
    it "Can see the lists of types of transactions" do
      expect(page).to have_text("Successful Charges")
      expect(page).to have_text("Failed Charges")
      expect(page).to have_text("Disputed Charges")
    end

    it "Can see the exact number of transactions in its corresponding list" do
      page.assert_selector('#successful-charges .charge-item', count: 10)
      page.assert_selector('#failed-charges .charge-item', count: 5)
      page.assert_selector('#disputed-charges .charge-item')
    end
  end
end