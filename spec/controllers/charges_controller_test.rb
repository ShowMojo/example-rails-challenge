require "rails_helper"

RSpec.describe ChargesController, :type => :controller do
  describe "GET #index" do
    it "should success response with correct number of transaction" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
	  expect(assigns(:successfull_charges)).not_to eq(nil)
	  expect(assigns(:failed_charges)).not_to eq(nil)
	  expect(assigns(:disputed_charges)).not_to eq(nil)

	  #check counts for records
	  expect(assigns(:successfull_charges).count).to eq(10)
	  expect(assigns(:failed_charges).count).to eq(5)
	  expect(assigns(:disputed_charges).count).to eq(5)
    end
  end
end