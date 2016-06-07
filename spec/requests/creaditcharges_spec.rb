require 'rails_helper'

RSpec.describe "Creaditcharges", type: :request do
  describe "GET /creaditcharges" do
    it "works! (now write some real specs)" do
      get creaditcharges_path
      expect(response).to have_http_status(200)
    end
  end
end
