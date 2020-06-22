Rails.application.routes.draw do
  root :to=> 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :authors
  resources :lists
  resources :books

  post '/lists/:list_id/add/:book_id' => 'lists#add', :as => 'add_book'
  delete '/lists/:list_id/remove/:book_id' => 'lists#remove', :as => 'remove_book'


  resources :users, :only => [:index, :new, :create]





end
