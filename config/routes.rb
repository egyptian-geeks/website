Rails.application.routes.draw do
  resources :users
  resources :tags
  resources :charts do
    collection do
      get  'posts'
      get  'get_posts_count'
    end
  end
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
