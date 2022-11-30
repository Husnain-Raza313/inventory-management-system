# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  resources :home, only: %i[index]
  resources :brands
  resources :suppliers
  devise_for :users
  authenticated :user, ->(u) { u.has_role?(:admin) } do
    root to: 'home#index', as: :admin_route
  end
  authenticated :user, ->(u) { u.has_role?(:cashier) } do
    root to: 'home#index', as: :user_route
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
