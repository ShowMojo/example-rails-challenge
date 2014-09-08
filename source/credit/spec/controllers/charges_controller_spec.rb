require "spec_helper"

describe ChargesController do
  describe "index" do
    it "renders the index template" do
      get :index
      response.should render_template("index")
      response.should be_ok
    end
  end
end