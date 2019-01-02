Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update, :index] do
    resources :messages, only: [:index]
  end
  root 'messages#index'
end
