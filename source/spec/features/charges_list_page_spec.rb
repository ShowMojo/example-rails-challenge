require "rails_helper"

include ChargeSeederService

RSpec.feature "Charges list page", :type => :feature do
  before { prepare_data_for_charges_list }
  scenario "User view the charges list page" do
    visit "/charges"

    should_have_failed_charges_list(page)
    should_have_disputed_charges_list(page)
    should_have_successfull_charges_list(page)
  end
end

def should_have_failed_charges_list(page)
  expect(page).to have_css("#failed-charges")
  expect(page).to have_text("Failed Charges")
  expect(page.find_all("#failed-charges table .data-row").size).to eq(5)
end

def should_have_disputed_charges_list(page)
  expect(page).to have_css("#disputed-charges")
  expect(page).to have_text("Disputed Charges")
  expect(page.find_all("#disputed-charges table .data-row").size).to eq(5)
end

def should_have_successfull_charges_list(page)
  expect(page).to have_css("#successful-charges")
  expect(page).to have_text("Successful Charges")
  expect(page.find_all("#successful-charges table .data-row").size).to eq(10)
end

def prepare_data_for_charges_list
  Customer.create(customers_attributes)
  prepare_credit_card_charges
end

def prepare_credit_card_charges
  Customer.all.each_with_index do |customer, index|
    case index
    when 0
      create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 5)
      create_credit_card_charge(customer, CHARGE_STATUSES[:disputed], 3)
    when 1
      create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 3)
      create_credit_card_charge(customer, CHARGE_STATUSES[:disputed], 2)
    when 2
      create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 1)
      create_credit_card_charge(customer, CHARGE_STATUSES[:failed], 3)
    when 3
      create_credit_card_charge(customer, CHARGE_STATUSES[:successfull], 1)
      create_credit_card_charge(customer, CHARGE_STATUSES[:failed], 2)
    end
  end
end

def customers_attributes
  [
    {
      first_name: 'Johny',
      last_name: 'Flow'
    },
    {
      first_name: 'Raj',
      last_name: 'Jamnis'
    },
    {
      first_name: 'Andrew',
      last_name: 'Chung'
    },
    {
      first_name: 'Mike',
      last_name: 'Smith'
    }
  ]
end
