Rails.application.routes.draw do
  ##--  Book
  get   'books'             => 'books#list'
  get   'books/new'         => 'books#new'
  post  'books/new'         => 'books#create'
  get   'books/:bid/edit'   => 'books#edit', as: :books_edit
  patch 'books/:bid/edit'   => 'books#update'
  get   'books/:bid/toggle' => 'books#toggle', as: :books_toggle
end

