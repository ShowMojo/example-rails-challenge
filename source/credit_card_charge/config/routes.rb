# frozen_string_literal: true
Rails.application.routes.draw do
  resources :charges, only: [:index]
end
