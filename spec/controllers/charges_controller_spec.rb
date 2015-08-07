require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe "GET #index" do
    it "return charges objects" do
      get :index
      expect(assigns(:successfull_charges).to_a).to eq(Charge.successfull)
      expect(assigns(:failed_charges).to_a).to eq(Charge.failed)
      expect(assigns(:disputed_charges).to_a).to eq(Charge.disputed)
    end
  end

end
