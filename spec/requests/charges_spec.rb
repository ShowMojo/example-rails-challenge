require 'rails_helper'

RSpec.describe 'Charges page', type: :request do
  it 'displays charges that failed' do
    customer = create(:customer, first_name: 'Mike')
    create(:failed_charge, customer: customer, amount: 1_000)

    get '/charges'

    expect(response.body).to include('Failed Charges')
    expect(response.body).to include('$10.00')
    expect(response.body).to include('Mike')
  end

  it 'displays charges that are in dispute' do
    customer = create(:customer, first_name: 'Mike')
    create(:disputed_charge, customer: customer, amount: 1_000)

    get '/charges'

    expect(response.body).to include('Disputed Charges')
    expect(response.body).to include('$10.00')
    expect(response.body).to include('Mike')
  end

  it 'displays charges that are successful' do
    customer = create(:customer, first_name: 'Mike')
    create(:successful_charge, customer: customer, amount: 1_000)

    get '/charges'

    expect(response.body).to include('Successful Charges')
    expect(response.body).to include('$10.00')
    expect(response.body).to include('Mike')
  end
end
