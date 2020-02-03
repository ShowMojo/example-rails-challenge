require "rails_helper"

describe "charges index", type: :feature do
  it "should have 3 lists" do
    visit '/charges'
    expect(page).to have_content 'Failed Charges'
    expect(all('tbody.failed tr').count).to be > 0

    expect(page).to have_content 'Disputed Charges'
    expect(all('tbody.disputed tr').count).to be > 0

    expect(page).to have_content 'Successful Charges'
    expect(all('tbody.successful tr').count).to be > 0

  end
  it "should have 10 successful charges" do
    visit '/charges'
    expect(all('tbody.successful tr').count).to eq(10)
  end
  it "should have 5 failed charges" do
    visit '/charges'
    expect(all('tbody.failed tr').count - all('tbody.failed tr.disputed').count).to eq(5)
  end
  describe "Disputed charges list" do
    it "should have failed charges" do
      visit '/charges'
      expect(all('tbody.failed tr.disputed').count).to eq(5)
    end
  end

end