Rails.application.routes.draw do
  get 'card_charges/index'

  resources :card_charges, path: :charges
end
