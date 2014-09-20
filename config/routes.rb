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
end

