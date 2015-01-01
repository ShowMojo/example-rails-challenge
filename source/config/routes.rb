Rails.application.routes.draw do
  resources :charges, only: [:index]
  root to: 'charges#index'
end
