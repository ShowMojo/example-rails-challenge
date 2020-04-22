Source::Application.routes.draw do
  resources :charges, only: [:index]
end
