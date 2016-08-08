Rails.application.routes.draw do
  root to: 'charges#index' 
  resources :charges, only: [:index]
end
