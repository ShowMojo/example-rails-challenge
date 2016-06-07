require "rails_helper"

RSpec.feature "Charges index", :type => :feature do 
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 
  end

  scenario "There are three lists on the charges page." do
    visit "/charges"
    
    list = find('ul').all('li')
    expect(list.count).to eq 3
    expect(list[0]).to have_text("Failed Charges")
    expect(list[1]).to have_text("Disputed Charges")
    expect(list[2]).to have_text("Successful Charges")

  end

  scenario "Verify that in the Successful charges list there are 10 line items. 
            Verify that in the failed charges list there are 5 failed charges. 
            Verify that in the disputed charges list there are failed charges." do
    visit "/charges"
    # table header row make plus one(+1)
    expect(find('ul li#successful-charges').all('tr').count).to eq Charge.successful.count + 1
    expect(find('ul li#failed-charges').all('tr').count).to eq Charge.failed.count + 1
    expect(find('ul li#disputed-charges').all('tr').count).to eq Charge.disputed.count + 1
  end 
end