require 'rails_helper'

RSpec.describe "charges/index.html.erb", type: :view do
  describe "Verify that there are three lists on the screen" do
    it "contains the successful charges lists" do
      successful = FactoryBot.create(:charge, :successful)
      assign(:successful, [successful])
      render
      expect(rendered).to match /Successful Charges/
    end

    it "contains the failed charges lists" do
      failed = FactoryBot.create(:charge, :failed)
      assign(:failed, [failed])
      render
      expect(rendered).to match /Failed Charges/
    end

    it "contains the disputed charges lists" do
      disputed = FactoryBot.create(:charge, :disputed)
      assign(:disputed, [disputed])
      render
      expect(rendered).to match /Disputed Charges/
    end
  end

  describe "Verify the items listed" do
    pending "should have 10 successful items" do
      10.times { FactoryBot.create(:charge, :successful) }
      assign(:successful, Charge.successful)
      render
      expect(rendered).to have_tag('ul.successful li', count: 10)
    end

    pending "should have 5 failed items" do
      5.times { FactoryBot.create(:charge, :failed) }
      assign(:successful, Charge.failed)
      render
      expect(rendered).to have_tag('ul.failed li', count: 5)
    end

    pending "should have 3 disputed items" do
      3.times { FactoryBot.create(:charge, :disputed) }
      assign(:successful, Charge.disputed)
      render
      expect(rendered).to have_tag('ul.disputed li', count: 3)
    end
  end
end
