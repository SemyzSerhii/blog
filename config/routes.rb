# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  get :log_out, to: 'sessions#destroy'

  resources :users, except: :index
  resources :posts
  resources :sessions, except: :index
end
