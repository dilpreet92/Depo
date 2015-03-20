Rails.application.routes.draw do
  devise_for :users

  resources :articles
  resource :email, only: :create
  resources :chats, only: :index
  root to: 'chats#index'

end
