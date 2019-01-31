require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  render_views

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders 3 list headers", :aggregate_failures do
      get :index
      expect(response.body).to include('<h1>Failed Charges</h1>')
      expect(response.body).to include('<h1>Disputed Charges</h1>')
      expect(response.body).to include('<h1>Successful Charges</h1>')
    end
  end

end
