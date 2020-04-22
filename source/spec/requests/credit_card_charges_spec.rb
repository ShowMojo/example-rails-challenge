# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CreditCardCharges', type: :request do
  describe 'GET /credit_card_charges' do
    it 'works! (now write some real specs)' do
      get credit_card_charges_path
      expect(response).to have_http_status(:ok)
    end
  end
end
