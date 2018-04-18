require 'rails_helper'

RSpec.describe ChargesController do
  describe "GET index" do
    it "assigns @failed" do
      failed = Charge.includes(:customer).failed
      get :index
      expect(assigns(:failed)).to eq(failed)
      expect(assigns(:failed).count).to eq 5
    end

    it "assigns @disputed" do
      disputed = Charge.includes(:customer).disputed
      get :index
      expect(assigns(:disputed)).to eq(disputed)
      expect(assigns(:disputed).count).to eq 5
    end

    it "assigns @successful" do
      successful = Charge.includes(:customer).successful
      get :index
      expect(assigns(:successful)).to eq(successful)
      expect(assigns(:successful).count).to eq 10
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
