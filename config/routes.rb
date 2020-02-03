Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users
  
  resources :posts, except: :index do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :favorites
      get :followings
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
