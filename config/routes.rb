# frozen_string_literal: true

Rails.application.routes.draw do
  resources :order_items, only: %i[create update destroy]
  resources :orders, only: %i[index]
  resources :categories
  resources :products
  resources :home, only: %i[index]
  resources :brands
  resources :suppliers
  resources :reports, only: %i[index]
  devise_for :users
  authenticated :user, ->(u) { u.has_role?(:admin) } do
    root to: 'home#index', as: :admin_route
  end
  authenticated :user, ->(u) { u.has_role?(:cashier) } do
    root to: 'orders#list', as: :user_route
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match ':status', to: 'application#page_not_found', via: :all
  get 'products/:id/analytics/:type', to: 'reports#analytics', as: :analytics
end
