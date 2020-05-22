require 'rails_helper'

RSpec.describe "Charge", :type => :feature do
  before :each do
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)
    customer4 = create(:customer)

    #successful charges
    create_list(:charge, 5, customer: customer1)
    create_list(:charge, 3, customer: customer2)
    create_list(:charge, 1, customer: customer3)
    create_list(:charge, 1, customer: customer4)

    #failed charges
    create_list(:charge, 3, customer: customer3, paid: false)
    create_list(:charge, 2, customer: customer4, paid: false)

    #disputed charges
    create_list(:charge, 3, customer: customer3, refunded: true)
    create_list(:charge, 2, customer: customer4, refunded: true)
  end

  it "render Failed charges list" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Failed Charges')
  end

  it "render Successful charges list" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  it "render Disputed charges list" do
    visit '/charges'

    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  scenario 'Successful list should contain correct number of rows' do
    visit '/charges'

    within('ul.charges-list.successful') do
      expect(page).to have_selector('li', count: 10)
    end
  end

  scenario 'Failed list should contain correct number of rows' do
    visit '/charges'

    within('ul.charges-list.failed') do
      expect(page).to have_selector('li', count: 5)
    end
  end

  scenario 'Disputed list should contain correct number of rows' do
    visit '/charges'
    charges = Charge.disputed

    charges.each do |charge|
      within('ul.charges-list.disputed') do
        expect(page).to have_selector('li', text: "#{charge.customer.name}, #{charge.amount}, #{charge.created_at}")
      end
    end
  end
end
