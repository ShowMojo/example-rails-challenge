Rails.application.routes.draw do
  resources :transactions
  resources :customers
  
  root to: 'transactions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
