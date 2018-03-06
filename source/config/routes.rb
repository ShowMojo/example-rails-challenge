Rails.application.routes.draw do
  root to: 'customers#index'
  get '/charges', to: 'credit_card_charges#index'
  resources :credit_card_charges
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
