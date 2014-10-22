Rails.application.routes.draw do
  resources :charges
  root to: 'charges#index'
end
