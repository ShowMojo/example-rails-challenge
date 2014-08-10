require 'rails_helper'

RSpec.describe "Charges", :type => :request do
  describe "GET /charges" do
    it "works! (now write some real specs)" do
      get charges_path
      expect(response.status).to be(200)
    end
  end
end
