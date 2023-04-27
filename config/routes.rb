Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root to: "homes#top"
  get "/home/about"=>"homes#about"
  
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create]
  end
  resources :book_comments, only: [:destroy]
end
