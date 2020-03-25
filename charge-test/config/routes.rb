Rails.application.routes.draw do
  resources :credit_card_charges, only: :index

  root 'credit_card_charges#index'
end
