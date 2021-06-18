# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/register', to: 'users#register'
      post '/login', to: 'users#login'
      resources :posts, only: [:index, :show, :create]
    end
  end


  resources :posts
  root to: 'pages#show'
end
