# frozen_string_literal: true

Rails.application.routes.draw do
  get 'charges' => 'charges#index'
  root 'charges#index'
end
