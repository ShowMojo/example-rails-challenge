require 'rails_helper'

describe 'Charges index page' do
  it 'has three tables' do
    visit charges_path

    successful = find('#successful-charges')
    failed = find('#failed-charges')
    disputed = find('#disputed-charges')

    expect(failed).to have_content 'Failed Charges'
    expect(successful).to have_content 'Successful Charges'
    expect(disputed).to have_content 'Disputed Charges'
  end

  context 'with customers and charges' do
    before do
      customer = FactoryBot.create(:customer)
      FactoryBot.create_list(:charge, 10, :successful, customer: customer)
      FactoryBot.create_list(:charge, 5, :failed, customer: customer)
      FactoryBot.create_list(:charge, 5, :disputed, customer: customer)
    end

    it 'has 10 line items in successful list' do
      visit charges_path

      successful = find('#successful-charges')
      line_items_count = successful.find_all('li').count

      expect(line_items_count).to eq 10
    end

    it 'has 5 failed charges in failed charges list' do
      visit charges_path

      failed = find('#failed-charges')

      failed_text = []

      failed.find_all('li').each do |li|
        ps = li.find_all('p').to_a.map(&:text)

        first_name, last_name = ps[0].gsub('Customer name: ', '').split(' ')

        failed_text << {
          first_name: first_name,
          last_name: last_name,
          amount: ps[1].gsub('Amount: ', '').to_i,
          created: ps[2].gsub('Charge date: ', '')
        }
      end

      failed_text.sort_by { |text| text[:amount] }

      failed_data = Charge.where(paid: false, refunded: true).map do |record|
        {
          first_name: record.customer.first_name,
          last_name: record.customer.last_name,
          amount: record.amount,
          created: record.created.strftime('%a %m/%d/%y%l:%M %p')
        }
      end

      failed_data.sort_by { |data| data[:amount] }

      expect(failed_data).to match_array(failed_text)
    end
  end

  it "doesn't have failed data in disputed data" do
    visit charges_path

    disputed = find('#disputed-charges')
    failed = find('#failed-charges')

    disputed_text = []
    failed_text = []

    disputed.find_all('li').each do |li|
      ps = li.find_all('p').to_a.map(&:text)

      first_name, last_name = ps[0].gsub('Customer name: ', '').split(' ')

      disputed_text << {
        first_name: first_name,
        last_name: last_name,
        amount: ps[1].gsub('Amount: ', '').to_i,
        created: ps[2].gsub('Charge date: ', '')
      }
    end

    failed.find_all('li').each do |li|
      ps = li.find_all('p').to_a.map(&:text)

      first_name, last_name = ps[0].gsub('Customer name: ', '').split(' ')

      failed_text << {
        first_name: first_name,
        last_name: last_name,
        amount: ps[1].gsub('Amount: ', '').to_i,
        created: ps[2].gsub('Charge date: ', '')
      }
    end

    disputed_text.sort_by { |text| text[:amount] }
    failed_text.sort_by { |text| text[:amount] }

    failed_data = Charge.where(paid: false, refunded: true).map do |record|
      {
        first_name: record.customer.first_name,
        last_name: record.customer.last_name,
        amount: record.amount,
        created: record.created.strftime('%a %m/%d/%y%l:%M %p')
      }
    end

    disputed_data = Charge.where(paid: false, refunded: false).map do |record|
      {
        first_name: record.customer.first_name,
        last_name: record.customer.last_name,
        amount: record.amount,
        created: record.created.strftime('%a %m/%d/%y%l:%M %p')
      }
    end

    failed_data.sort_by { |data| data[:amount] }
    disputed_data.sort_by { |data| data[:amount] }

    expect(failed_data).to_not include(disputed_text)
  end
end