Rails.application.routes.draw do
  resources :charges, only: [:index]
  root 'charges#index'
end
