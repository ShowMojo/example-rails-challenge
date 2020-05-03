# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'As a user, I can see the charges list on browser' do
  let(:customer1) { create(:customer, first_name: 'customer1', last_name: 'Flow') }
  let(:customer2) { create(:customer, first_name: 'customer2', last_name: 'Jamnis') }
  let(:customer3) { create(:customer, first_name: 'customer3', last_name: 'Chung') }
  let(:customer4)   { create(:customer, first_name: 'customer4', last_name: 'Smith') }

  before do
    # Successful
    create_list(:charge, 5, :successful, customer: customer1)
    create_list(:charge, 3, :successful, customer: customer2)
    create(:charge, :successful, customer: customer3)
    create(:charge, :successful, customer: customer4)

    # Failed
    create_list(:charge, 3, :failed, customer: customer3)
    create_list(:charge, 2, :failed, customer: customer4)

    # Disputed
    create_list(:charge, 3, :disputed, customer: customer1)
    create_list(:charge, 2, :disputed, customer: customer2)

    visit charges_path
  end

  scenario 'Index page should have 3 list for 3 types of charges' do
    within '.container' do
      page.should have_css(".list-group-item.failed,
                            .list-group-item.disputed,
                            .list-group-item.successful",
                           count: 3)
    end
  end

  scenario 'List should have 5 failed Charges' do
    within 'div.failed' do
      page.should have_content 'Failed Charges'
      page.should have_css('.list-group-item', count: 5)
    end
  end

  scenario 'List should have 5 disputes Charges' do
    within 'div.disputed' do
      page.should have_content 'Disputed Charges'
      page.should have_css('.list-group-item', count: 5)
    end
  end

  scenario 'List should have 10 Successful Charges' do
    within 'div.successful' do
      page.should have_content 'Successful Charges'
      page.should have_css('.list-group-item', count: 10)
    end
  end
end
