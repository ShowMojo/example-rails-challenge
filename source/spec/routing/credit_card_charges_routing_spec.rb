# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreditCardChargesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/credit_card_charges').to route_to('credit_card_charges#index')
    end

    it 'routes to #new' do
      expect(get: '/credit_card_charges/new').to route_to('credit_card_charges#new')
    end

    it 'routes to #show' do
      expect(get: '/credit_card_charges/1').to route_to('credit_card_charges#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/credit_card_charges/1/edit').to route_to('credit_card_charges#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/credit_card_charges').to route_to('credit_card_charges#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/credit_card_charges/1').to route_to('credit_card_charges#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/credit_card_charges/1').to route_to('credit_card_charges#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/credit_card_charges/1').to route_to('credit_card_charges#destroy', id: '1')
    end
  end
end
