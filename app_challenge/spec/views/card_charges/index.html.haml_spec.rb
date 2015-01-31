require 'spec_helper'

RSpec.describe "card_charges/index.html.haml", :type => :view do
  before do
    @failed,@successful,@disputed = CardCharge.failed.includes(:customer),
        CardCharge.successful.includes(:customer),
        CardCharge.disputed.includes(:customer)
    render
  end

  it 'it render a partial and show 3 lists' do
    expect(rendered).to include("tab_success")
    expect(rendered).to include("tab_failed")
    expect(rendered).to include("tab_disputed")
  end


  it 'list "successful" should contain 10 elements ' do
    expect(rendered).to include("Successful Count:10")
  end


  it 'list "Failed" should contain 5 elements ' do
    expect(rendered).to include("Failed Count:5")
  end


  it 'list "Disputed" should contain 5 elements ' do
    expect(rendered).to include("Disputed Count:5")
  end

end
