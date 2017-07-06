require 'rails_helper.rb'

RSpec.feature 'Charge List' do
  scenario 'can see all charges list' do
    visit '/'

    expect(page).to have_selector('div.failed-charges', count: 1)
    expect(page).to have_selector('div.disputed-charges', count: 1)
    expect(page).to have_selector('div.succed-charges', count: 1)

    expect(page).to have_css 'div.failed-charges h1', text: 'Failed Charges'
    expect(page).to have_css 'div.disputed-charges h1', text: 'Disputed Charges'
    expect(page).to have_css 'div.succed-charges h1', text: 'Successful Charges'

    page.has_css?('.failed-charges .transaction', count: 5)
    page.has_css?('.disputed-charges .transaction', count: 5)
    page.has_css?('.succed-charges .transaction', count: 10)

  end
end
