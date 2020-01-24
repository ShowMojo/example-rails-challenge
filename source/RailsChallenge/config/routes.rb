Rails.application.routes.draw do
  root 'home#index'
  get '/charges' => 'home#charges'
end
