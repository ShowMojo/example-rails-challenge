require 'rails_helper'

RSpec.describe CardChargesController, type: :controller do

  describe "GET #index" do
    it "returns 10 successful charges" do
      get :index
      expect(assigns(:succesful_charges).count).to eq(10)
    end

    it "returns 5 failed charges" do
      get :index
      expect(assigns(:failed_charges).count).to eq(5)
    end

    it "returns 5 disputed charges" do
      get :index
      expect(assigns(:disputed_charges).count).to eq(5)
    end
  end

end
