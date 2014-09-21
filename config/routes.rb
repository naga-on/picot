Rails.application.routes.draw do
  root to: 'logins#new'

  ##-- Login
  get  '/login'   => 'logins#new'
  post '/login'   => 'logins#login'
  get  '/destroy' => 'logins#destroy'

  ##--  User
  get   'users'             => 'users#list'
  get   'users/new'         => 'users#new'
  post  'users/new'         => 'users#create'
  get   'users/:uid/edit'   => 'users#edit', as: :users_edit
  patch 'users/:uid/edit'   => 'users#update'
  get   'users/:uid/toggle' => 'users#toggle', as: :users_toggle

  ##--  Book
  get   'books'             => 'books#list'
  get   'books/new'         => 'books#new'
  post  'books/new'         => 'books#create'
  get   'books/:bid/edit'   => 'books#edit', as: :books_edit
  patch 'books/:bid/edit'   => 'books#update'
  get   'books/:bid/toggle' => 'books#toggle', as: :books_toggle

  ##--  Genre
  get   'genres'             => 'genres#list'
  get   'genres/new'         => 'genres#new'
  post  'genres/new'         => 'genres#create'
  get   'genres/:gid/edit'   => 'genres#edit', as: :genres_edit
  patch 'genres/:gid/edit'   => 'genres#update'
  get   'genres/:gid/toggle' => 'genres#toggle', as: :genres_toggle

  ##--  Volume
  get   'books/:bid/volumes'             => 'volumes#list', as: :volumes
  get   'books/:bid/volumes/new'         => 'volumes#new', as: :volumes_new
  post  'books/:bid/volumes/new'         => 'volumes#create'
  get   'books/:bid/volumes/:vid/edit'   => 'volumes#edit', as: :volumes_edit
  patch 'books/:bid/volumes/:vid/edit'   => 'volumes#update'
  get   'books/:bid/volumes/:vid/toggle' => 'volumes#toggle', as: :volumes_toggle
end

