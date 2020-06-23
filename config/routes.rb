

Rails.application.routes.draw do
  root :to=> 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/books/search' => 'books#search', :as => 'search_book'
  get '/books/search/result' => 'books#result', :as => 'result_book'


  resources :authors
  resources :lists
  resources :books




  post '/lists/:list_id/add/:book_id' => 'lists#add', :as => 'add_book'
  delete '/lists/:list_id/remove/:book_id' => 'lists#remove', :as => 'remove_book'


  resources :users, :only => [:index, :new, :create]





end
