require 'rails_helper'


RSpec.describe CreditCardChargesController, type: :controller do

  before(:each) do
      @failed = []
      (1..10).each do |count|
        @failed << CreditCardCharge.create!(:paid => false,:amount => 9.99,:currency => "Usd",:refunded => false,:customer_id => 2)
      end
      @successful = [CreditCardCharge.create!(:paid => true,:amount => 9.99,:currency => "Usd",:refunded => false,:customer_id => 2)]
      @disputed = []
      (1..5).each do |count|
        @disputed << CreditCardCharge.create!(:paid => true,:amount => 9.99,:currency => "Usd",:refunded => true,:customer_id => 2)
      end
  end

  describe "GET #index" do
    it "Successful charges list there are 10 line items" do
      get :index
      expect(@failed.size).to eq 10
    end
  end

  describe "GET #index" do
    it "failed charges list there are 5 failed charges" do
      get :index
      expect(@disputed.size).to eq 5
    end
  end

  describe "GET #index" do
    it "disputed charges list there are failed charges" do
      get :index
      @disputed_failed = @disputed.collect{|df| df if df.paid == false }.compact
      expect(@disputed_failed.size).to eq 0
    end
  end



end
