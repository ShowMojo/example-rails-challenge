require 'rails_helper'

RSpec.describe "Charges", :type => :request do

  describe "list presence" do
    before(:each) do
      visit root_path
    end

    it "should have 3 lists total" do
      expect(page).to have_selector('ul', count: 3)
    end

    it "should have one succeed list" do
      expect(page).to have_selector('ul#succeed', count: 1)
    end

    it "should have one failed list" do
      expect(page).to have_selector('ul#failed', count: 1)
    end

    it "should have one disputed list" do
      expect(page).to have_selector('ul#disputed', count: 1)
    end

  end

  describe "Successful Charges to customers" do

    before :all do
      load "#{Rails.root}/db/seeds.rb"
    end

    before :each do
      visit root_path
    end

    it "succeed list should have 10 items" do
      expect(page).to have_selector('ul#succeed>li.item', count: 10)
    end

    it "failed list should have 5 items" do
      expect(page).to have_selector('ul#failed>li.item', count: 5)
    end

    it "disputed list should have 5 items" do
      expect(page).to have_selector('ul#disputed>li.item', count: 5)
    end

    after :all do
      Customer.delete_all
      Charge.delete_all
    end
  end

end
