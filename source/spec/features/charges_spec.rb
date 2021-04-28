require 'rails_helper'

describe 'Charges' do
  before do
    `RAILS_ENV=test bin/rake db:seed`
    visit '/charges'
  end

  scenario 'there are 3 lists' do
    expect(all('h1').size).to eq(3)
    expect(all('ol').size).to eq(3)
    expect(page).to have_xpath("//ol[preceding-sibling::h1[1][text()='Failed Charges']]")
    expect(page).to have_xpath("//h1[text()='Disputed Charges']")
    expect(page).to have_xpath("//h1[text()='Successful Charges']")
  end

  scenario 'there are 10 items in successful list' do
    expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Successful Charges']]/li").size).to eq(10)
  end

  scenario 'there 5 failed charges' do
    charges = Charge.failed
    expect(charges.count).to eq(5)
    charges.each do |charge|
      customer = "Customer: #{charge.customer.full_name}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Failed Charges']]/li[text()[contains(., '#{customer}')]]").any?).to eq(true)
      amount = "Amount: $#{(charge.amount.to_d / 100).to_s}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Failed Charges']]/li[text()[contains(., '#{amount}')]]").any?).to eq(true)
      date = "Date: #{I18n.l(Time.at(charge.created).to_date)}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Failed Charges']]/li[text()[contains(., '#{date}')]]").any?).to eq(true)
    end
  end

  scenario 'there 5 disputed charges' do
    charges = Charge.disputed
    expect(charges.count).to eq(5)
    charges.each do |charge|
      customer = "Customer: #{charge.customer.full_name}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Disputed Charges']]/li[text()[contains(., '#{customer}')]]").any?).to eq(true)
      amount = "Amount: $#{(charge.amount.to_d / 100).to_s}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Disputed Charges']]/li[text()[contains(., '#{amount}')]]").any?).to eq(true)
      date = "Date: #{I18n.l(Time.at(charge.created).to_date)}"
      expect(all(:xpath, "//ol[preceding-sibling::h1[1][text()='Disputed Charges']]/li[text()[contains(., '#{date}')]]").any?).to eq(true)
    end
  end
end
