class MainsController < ApplicationController
  def books
    @books = Array.new
    if params[:book].present? && params[:book][:genres].present?
      @input_genres = params[:book][:genres]
      Book.all.each do |book|
        book.genres.each do |genre|
          @books.push(book) if input_genres.include?(genre)
        end
      end
    else
      @books = Book.all
    end
  end

  def volumes
    @volumes = Volume.where(book_id: params[:bid])
  end
end

