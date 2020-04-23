Rails.application.routes.draw do
  get '/charges', to: 'charges#index'
end
