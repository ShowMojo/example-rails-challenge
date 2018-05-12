require 'rails_helper'

RSpec.feature "Charges", type: :feature do
  let!(:successful_charges) { create_list :charge, 5, :successful }
  let!(:failed_charges) { create_list :charge, 3, :failed }
  let!(:disputed_charges) { create_list :charge, 10, :disputed }

  before do
    visit charges_path
  end

  #it "can be visited" do
  #  visit charges_path
  #end

  it "shows failed charges" do
    within('.failed') do
      expect(page).to have_text("Failed charges")
      expect(all('.charge').count).to eq failed_charges.count
    end
  end

  it "shows disputed charges" do
    within('.disputed') do
      expect(page).to have_text("Disputed charges")
      expect(all('.charge').count).to eq disputed_charges.count
    end
  end

  it "shows successful charges" do
    within('.successful') do
      expect(page).to have_text("Successful charges")
      expect(all('.charge').count).to eq successful_charges.count
    end
  end


end
