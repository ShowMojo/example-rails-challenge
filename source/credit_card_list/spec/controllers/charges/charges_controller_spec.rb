require "rails_helper"

describe ChargesController do

  describe "index" do
    render_views
    it "displays three charge list" do
      get :index

      expect(response.body).to match /Failed Charges/m
      expect(response.body).to match /Disputed Charges/m
      expect(response.body).to match /Successful Charges/m
    end

    it "has 10 successful charges" do
      get :index

      expect(assigns[:successful_charges].count).to eq(10)
    end

    it "has 5 failed charges" do
      get :index

      expect(assigns[:failed_charges].count).to eq(5)
    end

    it "has failed charges in disputed charges" do
      get :index

      has_failed_charges = assigns[:disputed_charges].any?{|c| !c.paid }

      expect(has_failed_charges).to be true
    end
  end
end