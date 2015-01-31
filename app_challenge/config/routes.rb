Rails.application.routes.draw do
  get 'card_charges/index'
  root 'card_charges#index'

end
