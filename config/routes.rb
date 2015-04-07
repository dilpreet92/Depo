Rails.application.routes.draw do
  devise_for :users

  resources :articles
  resource :email, only: :create
  resources :chats, only: :index
  root to: 'chats#index'
  resources :payments, only: [:index, :create]
  namespace :pay do
    resources :events
  end

end
