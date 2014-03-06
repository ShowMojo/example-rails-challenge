RailsChallenge::Application.routes.draw do
  resources :charges
  resources :customers

  root to: 'charges#index'
end
