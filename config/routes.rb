Rails.application.routes.draw do

  root to: "homes#top"
  get "home/about" => 'homes#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'books/new'
  get "top" => "books#top"

  resources :users, only: [:show, :new, :create, :index, :destroy, :update, :edit]
  resources :books, only: [:new, :create, :index, :edit, :show, :destroy, :update]
  resources :home, only: [:top, :about]

end
