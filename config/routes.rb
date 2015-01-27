
Src::Application.routes.draw do

  root 'transactions#index'
  resources :mycustomers do
    resources :transactions
  end
  resources :transactions
end