Rails.application.routes.draw do

  root 'meetings#index'

  get "/submissions/:permalink" => 'submissions#index'
  get "/my_submissions/" => 'submissions#mine'
  post "/submissions" => 'submissions#create'
  get "/submissions/user/:user_id" => 'submissions#show'
  delete "/submissions/:id" => 'submissions#destroy'
  patch "/submissions" => 'submissions#update'

  get "/meetings" => "meetings#index"
  get "/meetings/new" => 'meetings#new'
  post "/meetings" => 'meetings#create'
  delete "/meetings/:id" => 'meetings#destroy'
  get "/meetings/:id/edit" => 'meetings#edit'
  patch "/meetings/:id" => 'meetings#update'

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

  post "/comments" => 'comments#create'
  delete "/comments/:id" => 'comments#destroy'
  patch "/comments/" => 'comments#update'
end