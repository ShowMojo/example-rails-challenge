require "rails_helper"

RSpec.describe ChargesController, :type => :controller do
  describe "#index" do
    it "should create charges correctly" do
      get :index
      expect(assigns(:successful_charges).length).to eql(10)
      expect(assigns(:failed_charges).length).to eql(5)
      expect(assigns(:disputed_charges)).not_to be_empty
    end
  end
end