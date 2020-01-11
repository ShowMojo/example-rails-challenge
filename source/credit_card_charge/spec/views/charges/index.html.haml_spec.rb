require 'rails_helper'

RSpec.describe "charges/index.html.haml", type: :view do
  describe 'index' do
    let!(:customer_1){create :customer, first_name: 'Johny', last_name: 'Flow'}
    let!(:customer_2){create :customer, first_name: 'Raj', last_name: 'Jamnis'}
    let!(:customer_3){create :customer, first_name: 'Andrew', last_name: 'Chung'}
    let!(:customer_4){create :customer, first_name: 'Mike', last_name: 'Smith'}

    before do
      (1..5).each{create :charge, :successful, customer: customer_1}
      (1..3).each{create :charge, :successful, customer: customer_2}
      create :charge, :successful, customer: customer_3
      create :charge, :successful, customer: customer_4

      (1..3).each{create :charge, :failed, customer: customer_3}
      (1..2).each{create :charge, :failed, customer: customer_4}

      (1..3).each{create :charge, :disputed, customer: customer_1}
      (1..2).each{create :charge, :disputed, customer: customer_2}

      assign(:failed_transactions, Charge.where(paid: false))
      assign(:successful_transactions, Charge.where(paid: true, refunded: false))
      assign(:disputed_transactions, Charge.where(paid: true, refunded: true))
    end

    it "should contain 3 lists" do
      render
      expect(rendered).to have_tag('div h1', count: 3)
    end

    it "should contain 10 items in successful charge list" do
      render
      expect(rendered).to have_tag('div.successful-charge .row', count: 10)
    end

    it "should contain 5 items in failed charge list" do
      render
      expect(rendered).to have_tag('div.failed-charge .row', count: 5)
    end

    it "should contain 5 items in disputed charge list" do
      render
      expect(rendered).to have_tag('div.disputed-charge .row', count: 5)
    end
  end
end
