# frozen_string_literal: true

Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get '/import', to: 'equipment#import'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :equipment do
    resources :entries
  end
  resources :equipment_imports
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
end
