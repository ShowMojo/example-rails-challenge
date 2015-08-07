require "rails_helper"

RSpec.feature "Visit charges list", :type => :feature do

    before(:each) do
      load "#{Rails.root}/db/seeds.rb"
      visit root_path
    end

    it "should render three types of lists" do
      expect(page).to have_css '.charges-list.failed-charges'
      expect(page).to have_css '.charges-list.disputed-charges'
      expect(page).to have_css '.charges-list.successfull-charges'
    end

    it "should render correct count of line items in successfull charges list" do
      expect(page).to have_css '.charges-list.successfull-charges .charge', count: Charge.successfull.count
      expect(page).to have_css '.charges-list.successfull-charges .charge', count: 10
    end

    it "should render correct count of line items in failed charges list" do
      expect(page).to have_css '.charges-list.failed-charges .charge', count: Charge.failed.count
      expect(page).to have_css '.charges-list.failed-charges .charge', count: 5
    end

    it "should render correct count of line items in disputed charges list" do
      expect(page).to have_css '.charges-list.disputed-charges .charge', count: Charge.disputed.count
      expect(page).to have_css '.charges-list.disputed-charges .charge', count: 5
    end

end