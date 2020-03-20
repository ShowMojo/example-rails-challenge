Rails.application.routes.draw do
  root to: 'charges#index'

  get 'charges' => 'charges#index'
end
