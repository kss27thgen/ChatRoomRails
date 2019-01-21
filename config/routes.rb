Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :index]
  resources :groups do
    resources :messages, only: [:index, :create, :destroy]
  end
  get 'home/top'
  root 'home#top'
end
