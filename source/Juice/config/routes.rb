Rails.application.routes.draw do
  root to: "charges#index"

  resource :charges, only: [:index]
end
