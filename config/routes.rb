Rails.application.routes.draw do
  root to: 'logins#new'

  ##-- Login
  get  '/login'   => 'logins#new'
  post '/login'   => 'logins#login'
  get  '/destroy' => 'logins#destroy'

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
end

