Rails.application.routes.draw do
  get '/Users/a/RubymineProjects/blog/app/views/commits/index.html.erb'
  resources :commits
  root 'commits#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
