require 'rails_helper'

RSpec.describe ChargesController, :type => :controller do
  render_views

  describe 'index' do
    describe 'successful list' do
      it 'renders list' do
        get :index
        expect(response.body).to match /Successful Charges/im
      end

      it 'has 10 items' do
        get :index
        expect(response.body).to have_selector('.item.state-success', count: 10)
      end
    end

    describe 'failed list' do
      it 'renders list' do
        get :index
        expect(response.body).to match /Failed Charges/im
      end

      it 'has 5 items' do
        get :index
        expect(response.body).to have_selector('.item.state-failed', count: 5)
      end
    end

    describe 'disputed list' do
      it 'renders list' do
        get :index
        expect(response.body).to match /Disputed Charges/im
      end

      it 'has 5 items' do
        get :index
        expect(response.body).to have_selector('.item.state-disputed', count: 5)
      end
    end
  end
end
