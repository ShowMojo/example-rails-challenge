require 'rails_helper'

RSpec.feature "Charges Lists page" do
  before do
    Rails.application.load_seed
    visit "/charges"
  end

  it "contains 3 lists on the screen", :aggregate_failures do
    expect(page).to have_xpath("//h1[text()='Successful Charges']/following-sibling::ul")
    expect(page).to have_xpath("//h1[text()='Failed Charges']/following-sibling::ul")
    expect(page).to have_xpath("//h1[text()='Disputed Charges']/following-sibling::ul")
  end

  it 'contains 10 lines of successful charges' do
    line_items = page.all(:xpath, "//h1[text()='Successful Charges']/following-sibling::ul/li")
    expect(line_items.size).to eq(10)
  end

  it 'contains 5 lines of failed charges' do
    line_items = page.all(:xpath, "//h1[text()='Failed Charges']/following-sibling::ul/li")
    expect(line_items.size).to eq(5)
  end

  it 'contains 5 lines of disputed charges' do
    line_items = page.all(:xpath, "//h1[text()='Disputed Charges']/following-sibling::ul/li")
    expect(line_items.size).to eq(5)
  end
end
