Rails.application.routes.draw do

  root 'meetings#index'

  get "/submissions/:id" => 'submissions#index'
  get "/books/new" => 'books#new'
  post "/books" => 'books#create'
  # get "/submissions/:id" => 'submissions#show'
  delete "/books/:id" => 'books#destroy'
  get "/books/:id/edit" => 'books#edit'
  patch "/books/:id" => 'books#update'

  get "/authors" => "authors#index"
  get "/authors/new" => 'authors#new'
  post "/authors" => 'authors#create'
  get "/authors/:id" => 'authors#show'
  delete "/authors/:id" => 'authors#destroy'
  get "/authors/:id/edit" => 'authors#edit'
  patch "/authors/:id" => 'authors#update'

  get "/signup" => "users#new"

  get "/sessions/new" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#delete"


  get "/users" => "users#index"
  get "/users/new" => 'users#new'
  post "/users" => 'users#create'
  get "/users/:id" => 'users#show'
  delete "/users/:id" => 'users#destroy'
  get "/users/:id/edit" => 'users#edit'
  patch "/users/:id" => 'users#update'

  post "/reviews" => 'reviews#create'


end