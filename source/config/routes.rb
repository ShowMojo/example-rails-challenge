Rails.application.routes.draw do
  resources :credit_card_charges, path: :charges
  root 'credit_card_charges#index'
end
