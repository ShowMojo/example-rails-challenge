Rails.application.routes.draw do
  resources :customers
  resources :credit_card_charges

  root 'credit_card_charges#index'
end
