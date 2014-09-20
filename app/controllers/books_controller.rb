class BooksController < ApplicationController
  before_action :get_book, only: [:edit, :update, :toggle]

  def list
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    render :new and return unless @book.save
    render template: "shared/reload"
  end

  def edit
  end

  def update
    render :edit and return unless @book.update(book_params)
    render template: "shared/reload"
  end

  def toggle
    @book.update(is_active: !@book.is_active)
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end

  def get_book
    @book = Book.where(id: params[:bid]).first
  end
end

