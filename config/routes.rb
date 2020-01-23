Rails.application.routes.draw do
  
  root to: 'posts#index'

  devise_for :users
  
  resources :posts, except: :index
  resources :users, only: [:show, :edit, :update]
end
