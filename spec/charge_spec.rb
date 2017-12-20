require 'rails_helper'

RSpec.describe "Charges page", :type => :request do
  context 'display on page' do
    before { get "/charges" }

    it "Failed Charges list" do
      expect(response.body).to include('Failed Charges')
    end

    it "Disputed Charges list" do
      expect(response.body).to include('Disputed Charges')
    end

    it "Successful Charges list" do
      expect(response.body).to include('Successful Charges')
    end
  end

  context 'Count transactions on page' do
    before { visit "/charges" }

    it "Failed" do
      expect(page).to have_selector('.failed', count: 5)
    end
    it "Disputed" do
      expect(page).to have_selector('.disputed', count: 5)
    end
    it "Successful" do
      expect(page).to have_selector('.successful', count: 10)
    end
  end
end