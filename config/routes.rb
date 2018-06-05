# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#index'
  root 'users#index'
  root 'posts#index'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'


  resources :users
  resources :posts
  resources :sessions
end
