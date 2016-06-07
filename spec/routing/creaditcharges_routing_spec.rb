require "rails_helper"

RSpec.describe CreaditchargesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creaditcharges").to route_to("creaditcharges#index")
    end

    it "routes to #new" do
      expect(:get => "/creaditcharges/new").to route_to("creaditcharges#new")
    end

    it "routes to #show" do
      expect(:get => "/creaditcharges/1").to route_to("creaditcharges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creaditcharges/1/edit").to route_to("creaditcharges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creaditcharges").to route_to("creaditcharges#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creaditcharges/1").to route_to("creaditcharges#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creaditcharges/1").to route_to("creaditcharges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creaditcharges/1").to route_to("creaditcharges#destroy", :id => "1")
    end

  end
end
