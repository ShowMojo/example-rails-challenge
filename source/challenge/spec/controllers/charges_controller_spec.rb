require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads charges' do
      successful = create_list :charge, 3
      failed = create_list :charge, 2, paid: false
      disputed = create_list :charge, 1, refunded: true

      get :index
      expect(assigns(:successful)).to eq(successful)
      expect(assigns(:failed)).to eq(failed)
      expect(assigns(:disputed)).to eq(disputed)
    end
  end
end
