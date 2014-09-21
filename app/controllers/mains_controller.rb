class MainsController < ApplicationController
  def books
    @books = Book.all
  end

  def volumes
    @volumes = Volume.where(book_id: params[:bid])
  end
end

