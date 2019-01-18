require "spec_helper"

describe ChargesController do
  describe "GET#index" do
    before { get :index }
    it "renders the index template" do
      expect(response).to render_template("index")
      expect(response.code).to eq "200"
    end

    it "assigns all charges to charges variable" do
    	expect(assigns(:charges)).to eq Charge.all
    end
  end
end
