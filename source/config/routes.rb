Rails.application.routes.draw do
  get '/charges', to: 'charges#index'
  root 'charges#index'
end
