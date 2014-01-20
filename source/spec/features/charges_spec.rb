require 'spec_helper'

feature "Charges" do
  it "display all three lists" do
    visit "/charges"

    expect(page).to have_content "Failed Charges"
    expect(page).to have_content "Disputed Charges"
    expect(page).to have_content "Successful Charges"
  end

  it "lists 10 successful chages" do
    visit "/charges"

    expect(find("#successful tr").count).to eq(11)
  end

  it "lists 5 failed chages" do
    visit "/charges"

    expect(find("#failed tr").count).to eq(6)
  end

  it "lists failed chages in disputed list" do
    visit "/charges"

    pending
  end
end
