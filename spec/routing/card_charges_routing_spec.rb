require "rails_helper"

RSpec.describe CardChargesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/card_charges").to route_to("card_charges#index")
    end

    it "routes to #new" do
      expect(:get => "/card_charges/new").to route_to("card_charges#new")
    end

    it "routes to #show" do
      expect(:get => "/card_charges/1").to route_to("card_charges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/card_charges/1/edit").to route_to("card_charges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/card_charges").to route_to("card_charges#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/card_charges/1").to route_to("card_charges#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/card_charges/1").to route_to("card_charges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/card_charges/1").to route_to("card_charges#destroy", :id => "1")
    end

  end
end
