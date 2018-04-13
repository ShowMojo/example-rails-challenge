Rails.application.routes.draw do
  get 'charges', to: 'charges#index', as: :charges
  root 'charges#index'
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
