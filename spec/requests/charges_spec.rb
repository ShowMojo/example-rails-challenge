require 'rails_helper'

RSpec.describe Charge, type: :request do

  describe "GET /index" do
    before {get '/charges'}

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "should verify total charges" do
      expect(@controller.instance_variable_get(:@charges).count).to eq(20)
    end

    it "should return 10 items in successful charges list" do
      expect(@controller.instance_variable_get(:@charges).successful.count).to eq(10)
    end

    it "should return 5 items in failed charges list" do
      expect(@controller.instance_variable_get(:@charges).failed.count).to eq(5)
    end

    it "should return 5 items in disputed charges list" do
      expect(@controller.instance_variable_get(:@charges).disputed.count).to eq(5)
    end

    it "should have `Successful Charges` heading inside H1 element" do
      expect(response.body).to include("<h1>Successful Charges</h1>")
    end

    it "should have `Failed Charges` heading inside H1 element" do
      expect(response.body).to include("<h1>Failed Charges</h1>")
    end

    it "should have `Disputed Charges` heading inside H1 element" do
      expect(response.body).to include("<h1>Disputed Charges</h1>")
    end
  end
end
