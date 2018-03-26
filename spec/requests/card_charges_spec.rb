require 'rails_helper'

RSpec.describe "CardCharges", type: :request do
  describe "GET /card_charges" do
    it "works! (now write some real specs)" do
      get card_charges_path
      expect(response).to have_http_status(200)
    end
  end
end
