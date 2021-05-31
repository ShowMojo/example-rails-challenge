require "rails_helper"

describe "Charges" do

  before :each do
    [
      { customer: { first_name: "John",   last_name: "Flow" },   charges: { successful: 5, failed: 0, disputed: 3 } },
      { customer: { first_name: "Raj",    last_name: "Jamnis" }, charges: { successful: 3, failed: 0, disputed: 2 } },
      { customer: { first_name: "Andrew", last_name: "Chung" },  charges: { successful: 1, failed: 3, disputed: 0 } },
      { customer: { first_name: "Mike",   last_name: "Smith" },  charges: { successful: 1, failed: 2, disputed: 0 } }
    ].each do |h|
      customer = FactoryBot.create(:customer, h[:customer])
      h[:charges].each do |k, v|
        FactoryBot.create_list :charge, v, k, customer: customer
      end
    end
  end

  it "shows all the charges" do
    visit "/charges"

    expect(page).to have_css("div.disputed h1", text: "Disputed Charges")
    expect(page).to have_css("div.successful h1", text: "Successful Charges")
    expect(page).to have_css("div.failed h1", text: "Failed Charges")

    expect(find_all("div.failed li").count).to eq Charge.failed.count
    expect(find_all("div.successful li").count).to eq Charge.successful.count
    expect(find_all("div.disputed li").count).to eq Charge.disputed.count
  end
end
