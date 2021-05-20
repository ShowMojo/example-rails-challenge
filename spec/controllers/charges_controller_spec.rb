require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe "GET index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @charges" do

      get :index
      expect(assigns(:charges).count).to eq(20)
    end
  end
end