# frozen_string_literal: true

Rails.application.routes.draw do
  get 'log_out' => 'sessions#destroy', :as => 'log_out'

  root 'users#index'

  resources :users
  resources :posts
  resources :sessions
end
