Rails.application.routes.draw do
  resources :users
  resources :tags
  resources :posts
  resources :events, controller: :posts
  resources :links, controller: :posts
  resources :music, controller: :posts
  resources :notes, controller: :posts
  resources :offers, controller: :posts
  resources :photos, controller: :posts
  resources :status, controller: :posts
  resources :videos, controller: :posts
  root 'posts#index'
end
