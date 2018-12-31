require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    describe "when there's successful charges" do
      it "returns a successful charge" do
        successful = FactoryBot.create(:charge, :successful)
        get :index

        expect(assigns(:successful)).to eq Charge.successful
      end
    end

    describe "when there's failed charges" do
      it "returns a failed charge" do
        failed = FactoryBot.create(:charge, :failed)
        get :index

        expect(assigns(:failed)).to eq Charge.failed
      end
    end

    describe "when there's disputed charges" do
      it "returns a disputed charge" do
        disputed = FactoryBot.create(:charge, :disputed)
        get :index

        expect(assigns(:disputed)).to eq Charge.disputed
      end
    end

    it "assings 3 type of charges to the view" do
      successful = FactoryBot.create(:charge, :successful)
      failed = FactoryBot.create(:charge, :failed)
      disputed = FactoryBot.create(:charge, :disputed)

      get :index

      expect(assigns(:successful)).to eq Charge.successful
      expect(assigns(:failed)).to eq Charge.failed
      expect(assigns(:disputed)).to eq Charge.disputed
    end
  end
end
