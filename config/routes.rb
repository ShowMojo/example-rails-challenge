Rails.application.routes.draw do

  root 'charges#index'
  
  resources :customers
  resources :charges

end
