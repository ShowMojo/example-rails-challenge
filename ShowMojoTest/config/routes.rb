Rails.application.routes.draw do
  #show credit card charge list at root page
  root 'charges#index'
  resources :charges, only: :index
end
