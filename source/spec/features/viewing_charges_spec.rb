require 'spec_helper'

describe 'Viewing charges' do
  let!(:successful) { FactoryGirl.create_list(:charge, 10, :successful) }
  let!(:failed) { FactoryGirl.create_list(:charge, 5, :failed) }
  let!(:disputed) { FactoryGirl.create_list(:charge, 5, :disputed) }

  before(:each) { visit charges_path }

  it 'shows three lists' do
    page.should have_text('Failed Charges')
    page.should have_text('Disputed Charges')
    page.should have_text('Successful Charges')
  end

  it 'shows all disputed items in successful list' do
    within('div', text: 'Disputed Charges') do
      disputed.each do |charge|
        fields(charge).each do |field|
          page.should have_text(field)
        end
      end
    end
    page.should have_css('table.disputed tbody tr', count: 5)
  end

  it 'shows all successful items in successful list' do
    within('div', text: 'Successful Charges') do
      successful.each do |charge|
        fields(charge).each do |field|
          page.should have_text(field)
        end
      end
    end
    page.should have_css('table.successful tbody tr', count: 10)
  end

  it 'shows all failed items in successful list' do
    within('div', text: 'Failed Charges') do
      failed.each do |charge|
        fields(charge).each do |field|
          page.should have_text(field)
        end
      end
      page.should have_css('table.failed tbody tr', count: 5)
    end
  end

  def fields(charge)
    [charge.id, charge.customer.first_name, charge.customer.last_name, charge.amount, charge.created_at]
  end
end

