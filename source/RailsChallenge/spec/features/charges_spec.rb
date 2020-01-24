require 'rails_helper'

RSpec.describe "Charges" do
  feature "Charges page" do

    before do
      visit charges_path
    end

    scenario "Page have failed trasactionck" do
      expect(page.all(:css, '.failed_charge').size).to eq(5)
    end

    scenario "Page have failed successfull transaction" do
      expect(page.all(:css, '.successful_charges').size).to eq(10)
    end

    scenario "Page have failed trasactionck" do
      expect(page.all(:css, '.disputed_charge').size).to eq(5)
    end
  end
end