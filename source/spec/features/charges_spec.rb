require 'spec_helper'

feature "Charges" do
  it "display all three lists" do
    visit "/charges"

    expect(page).to have_content "Failed Charges"
    expect(page).to have_content "Disputed Charges"
    expect(page).to have_content "Successful Charges"
  end

  it "lists 10 successful charges" do
    visit "/charges"

    expect(all("#successful tr").count).to eq(11)
  end

  it "lists 5 failed charges" do
    visit "/charges"

    expect(all("#failed tr").count).to eq(6)
  end

  it "lists 5 disputed charges" do
    visit "/charges"

    expect(all("#failed tr").count).to eq(6)
  end
end
