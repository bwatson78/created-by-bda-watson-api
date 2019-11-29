# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :blogs
  get '/brads_deets', to: 'users#brads_deets'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
