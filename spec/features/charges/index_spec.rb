require 'rails_helper'

def extract_customer_name(text)
  text.gsub('Customer name: ', '').split(' ')
end

def extract_amount_number(text)
  text.gsub('Amount: ', '').to_i
end

def extract_charge_date(text)
  text.gsub('Charge date: ', '')
end

def extract_line_items(li)
  li.find_all('p').to_a.map(&:text)
end

def transactions_text(id, context)
  text = []

  context.find(id).find_all('li').each do |li|
    line_items = extract_line_items(li)
    first_name, last_name = extract_customer_name(line_items[0])
    amount = extract_amount_number(line_items[1])
    created = extract_charge_date(line_items[2])

    text << { first_name: first_name, last_name: last_name, amount: amount, created:  created}
  end

  text
end

def transactions_data(charges)
  charges.map do |record|
    {
      first_name: record.customer.first_name,
      last_name: record.customer.last_name,
      amount: record.amount,
      created: record.created.strftime('%a %m/%d/%y%l:%M %p')
    }
  end
end

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
    let(:customer) { create(:customer) }

    let!(:failed_charges) do
      charges = []
      5.times { charges << create(:charge, :failed, customer: customer) }
      charges
    end

    let!(:disputed_charges) do
      charges = []
      5.times { charges << create(:charge, :disputed, customer: customer) }
      charges
    end

    let!(:successful_charges) do
      charges = []
      10.times { charges << create(:charge, :successful, customer: customer) }
      charges
    end

    it 'has 10 line items in successful list' do
      visit charges_path

      successful = find('#successful-charges')
      line_items_count = successful.find_all('li').count

      successful_text = transactions_text('#successful-charges', self)
      successful_text.sort_by { |text| text[:amount] }

      successful_data = transactions_data(successful_charges)
      successful_data.sort_by { |data| data[:amount] }

      expect(successful_text).to match_array(successful_data)
      expect(line_items_count).to eq 10
    end

    it 'has 5 failed charges in failed charges list' do
      visit charges_path

      failed_text = transactions_text('#failed-charges', self)
      failed_text.sort_by { |text| text[:amount] }

      failed_data = transactions_data(failed_charges)
      failed_data.sort_by { |data| data[:amount] }

      expect(failed_data).to match_array(failed_text)
    end

    it "doesn't have failed data in disputed data" do
      visit charges_path

      disputed_text = transactions_text('#disputed-charges', self)
      failed_text = transactions_text('#failed-charges', self)

      disputed_text.sort_by { |text| text[:amount] }
      failed_text.sort_by { |text| text[:amount] }

      failed_data = transactions_data(failed_charges)
      disputed_data = transactions_data(disputed_charges)

      failed_data.sort_by { |data| data[:amount] }
      disputed_data.sort_by { |data| data[:amount] }

      expect(failed_data).to_not include(disputed_text)
    end
  end
end