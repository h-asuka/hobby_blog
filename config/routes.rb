Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users
  
  resources :posts, except: :index do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  resources :relationships, only: [:create, :destroy]
end
