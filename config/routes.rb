Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :groups do
    resources :messages, only: [:index, :create]
  end
  root 'groups#index'
end

