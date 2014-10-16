Rails.application.routes.draw do
  root to: "charges#index"
  resources :customers
  resources :charges

end
