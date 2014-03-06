require "spec_helper"

describe ChargesController do
  describe "routing" do

    it "routes to #index" do
      get("/charges").should route_to("charges#index")
    end

    it "routes to #new" do
      get("/charges/new").should route_to("charges#new")
    end

    it "routes to #show" do
      get("/charges/1").should route_to("charges#show", :id => "1")
    end

    it "routes to #edit" do
      get("/charges/1/edit").should route_to("charges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/charges").should route_to("charges#create")
    end

    it "routes to #update" do
      put("/charges/1").should route_to("charges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/charges/1").should route_to("charges#destroy", :id => "1")
    end

  end
end
