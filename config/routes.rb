# frozen_string_literal: true

Rails.application.routes.draw do
  resources :home, only: %i[index]
  resources :brands
  devise_for :users
  authenticated :user, ->(u) { u.has_role?(:admin) } do
    root to: 'home#index', as: :admin_route
  end
  authenticated :user, ->(u) { u.has_role?(:cashier) } do
    root to: 'home#index', as: :user_route
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
