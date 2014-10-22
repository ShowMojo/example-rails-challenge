require 'rails_helper'

RSpec.describe "Charges", type: :request do
  describe "GET /charges" do
    before  do
      get charges_path
      expect(response.status).to be(200)
    end

    it "should show 3 list of type of charges" do
      assert_select ".charge-table.failed"
      assert_select ".charge-table.disputed"
      assert_select ".charge-table.successful"
    end

    it "should show specific count of charges by types" do
      assert_select ".charge-table.failed tr.charge-row-value", count: 5
      assert_select ".charge-table.disputed tr.charge-row-value", count: 5
      assert_select ".charge-table.successful tr.charge-row-value", count: 10
    end
  end
end
