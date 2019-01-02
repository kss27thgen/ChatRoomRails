Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :messages, only: [:index]
  resources :group, only: [:new, :create, :edit, :update]
  root 'messages#index'
end
