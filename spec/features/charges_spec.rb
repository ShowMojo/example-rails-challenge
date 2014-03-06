require 'spec_helper'

describe 'Charges page' do
  it 'should render charges' do
    visit 'charges'
  end
end

describe 'Charges Items' do
  before do
    @customer = Customer.create!(first_name: 'Adam', last_name: 'Sandler')
    #@customer = Customer.create!(first_name: 'Adam2', last_name: 'Sandler2')
    #@customer = Customer.create!(first_name: 'Adam3', last_name: 'Sandler3')
    #@customer = Customer.create!(first_name: 'Adam4', last_name: 'Sandler4')

    10.times do |n|
      created = rand(10560) + n
      amount = rand(10560) + n
      Charge.create!(created: created, amount: amount, paid: true, currency: 'USD', refunded: false, customer_id: @customer.id)
    end

    5.times do |n|
      created = rand(10560) + n
      amount = rand(10560) + n
      Charge.create!(created: created, amount: amount, paid: false, currency: 'USD', refunded: false, customer_id: @customer.id)
    end

    5.times do |n|
      created = rand(10560) + n
      amount = rand(10560) + n
      Charge.create!(created: created, amount: amount, paid: true, currency: 'USD', refunded: true, customer_id: @customer.id)
    end
  end

  it 'H1 correct messages' do
    visit 'charges'
    expect(page).to have_css('h1', text: 'Failed Charges')
    expect(page).to have_css('h1', text: 'Disputed Charges')
    expect(page).to have_css('h1', text: 'Successful Charges')
  end

  it 'there are 3 lists on the screen' do
    visit 'charges'
    ['failed-charges', 'disputed-charges', 'successful-charges'].each do |i|
      expect(page).to have_css("ol.#{i}")
    end
  end

  it 'there are 5 failed charges' do
    visit 'charges'
    expect(page).to have_css('ol.failed-charges li', count: 5)
  end

  it 'there are 5 disputed charges' do
    visit 'charges'
    expect(page).to have_css('ol.disputed-charges li', count: 5)
  end

  it 'there are 10 successful charges' do
    visit 'charges'
    expect(page).to have_css('ol.successful-charges li', count: 10)
  end
end