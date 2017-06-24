TestTask::Application.routes.draw do
  resources :charges, :only => :index
  root 'charges#index'
end
