# frozen_string_literal: true

Rails.application.routes.draw do
  resources :credit_card_charges
  resources :customers
  root to: 'credit_card_charges#index'
end
