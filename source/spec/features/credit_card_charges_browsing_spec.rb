require 'rails_helper'

RSpec.describe "Credit card charges browsing", type: :feature do
  scenario 'loads tables' do
    visit '/charges'

    expect(page).to have_text 'Failed Charges'
    expect(page).to have_text 'Disputed Charges'
    expect(page).to have_text 'Successful Charges'
    expect(page).to have_css 'table.paid_credit_card_charges'
    expect(page).to have_css 'table.failed_credit_card_charges'
    expect(page).to have_css 'table.disputed_credit_card_charges'
  end

  scenario 'groups paid charges in tables' do
    visit '/charges'

    paid_rows = page.find_all('table.paid_credit_card_charges tbody tr')
    expect(paid_rows.count).to eq 10
  end

  scenario 'groups failed charges in tables' do
    visit '/charges'
    failed_rows = page.find_all('table.failed_credit_card_charges tbody tr')

    CreditCardCharge.failed.each_with_index do |charge, i|
      expect(failed_rows[i].text).to include charge.name
      expect(failed_rows[i].text).to include charge.human_amount.to_s
      expect(failed_rows[i].text).to include I18n.l(charge.created_at, format: :short)
    end
  end

  scenario 'disputed contains failed charges' do
    visit '/charges'
    disputed_rows_ids = page.find_all('table.failed_credit_card_charges tbody tr').map { |r| r[:id] }
    failed_and_disputed_ids = CreditCardCharge.disputed.failed.map { |c| "credit_card_charge_#{c.id}" }

    failed_and_disputed_ids.each do |charge_id|
      expect(disputed_rows_ids).to include charge_id
    end
  end
end
