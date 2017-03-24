Rails.application.routes.draw do
  resources :charges, only: [:charges]
end
