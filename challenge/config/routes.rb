Rails.application.routes.draw do

  resource :charges, only: :index

  root to: 'charges#index'
end
