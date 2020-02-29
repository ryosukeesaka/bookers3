Rails.application.routes.draw do

  root to: "homes#top"
  get "home/about" => 'homes#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/new'
  get "top" => "books#top"
  get "users/:id/follows" => "relationships#follows", as: "follows"
  get "users/:id/followers" => "relationships#followers", as: "followers"
  post 'relationships/:id' => 'relationships#create', as: 'relationships'#user_isとfolloewd_idが結びついたもの,
  get "search" => "users#search", as: "search"

  resources :users, only: [:show, :new, :create, :index, :destroy, :update, :edit]
  resources :relationships, only: [:destroy,]

  resources :books, only: [:new, :create, :index, :edit, :show, :destroy, :update] do
  	resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :home, only: [:top, :about]

end
