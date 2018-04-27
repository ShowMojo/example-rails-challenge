require 'rails_helper'

describe "#index" do
  before do
    # TODO: Generate dummy data same as on the task. It's same as `seed`.
    cus1 = Customer.find_or_create_by(first_name: 'Johny', last_name: 'Flow')
    cus2 = Customer.find_or_create_by(first_name: 'Raj', last_name: 'Jamnis')
    cus3 = Customer.find_or_create_by(first_name: 'Andrew', last_name: 'Chung')
    cus4 = Customer.find_or_create_by(first_name: 'Mike', last_name: 'Smith')

    FactoryBot.create_list(:paid_charge, 5, customer: cus1)
    FactoryBot.create_list(:paid_charge, 3, customer: cus2)
    FactoryBot.create_list(:paid_charge, 1, customer: cus3)
    FactoryBot.create_list(:paid_charge, 1, customer: cus4)

    FactoryBot.create_list(:failed_charge, 3, customer: cus3)
    FactoryBot.create_list(:failed_charge, 2, customer: cus4)

    FactoryBot.create_list(:disputed_charge, 3, customer: cus1)
    FactoryBot.create_list(:disputed_charge, 2, customer: cus2)

    visit root_path
  end

  describe 'successful charges' do
    it 'should have header' do
      expect(page).to have_selector('h1', text: 'Successful Charges')
    end

    it 'should have 10 successful charges' do
      expect(page).to have_selector('table.success-charges tbody > tr', count:10)
    end
  end

  describe 'failed charges' do
    it 'should have header' do
      expect(page).to have_selector('h1', text: 'Failed Charges')
    end

    it 'should have 5 failed charges' do
      expect(page).to have_selector('table.failed-charges tbody > tr', count: 5)
    end
  end

  describe 'disputed charges' do
    it 'should have header' do
      expect(page).to have_selector('h1', text: 'Failed Charges')
    end

    it 'should have 5 disputed charges' do
      expect(page).to have_selector('table.disputed-charges tbody > tr', count: 5)
    end
  end
end