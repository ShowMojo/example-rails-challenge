require 'rails_helper'
describe ChargesController do
	describe "GET #index" do
		before :all do 
			Rails.application.load_seed
		end
		it "populates array of disputed charges correctly" do
			get :index
			expect( assigns( :disputed_charges )).to match_array( Charge.disputed ) 
		end
	end
end