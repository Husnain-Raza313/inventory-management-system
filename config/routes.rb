# frozen_string_literal: true

Rails.application.routes.draw do
  resources :home, only: %i[index]
  resources :brands
  devise_for :users
  authenticated :user do
    root to: 'home#index', as: :admin_route
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
