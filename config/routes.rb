Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about"=>"homes#about"
  
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
  resources :favorites,only: [:create, :destroy]
  collection do
     get :favories
  end
end
end
