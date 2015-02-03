Rails.application.routes.draw do

  resources :charges
  resources :customers

  root 'charges#index'

end
