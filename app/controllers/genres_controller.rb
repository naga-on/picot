class GenresController < ApplicationController
  before_action :get_genre, only: [:edit, :update, :toggle]

  def list
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    render :new and return unless @genre.save
    render template: "shared/reload"
  end

  def edit
  end

  def update
    render :edit and return unless @genre.update(genre_params)
    render template: "shared/reload"
  end

  def toggle
    @genre.update(is_active: !@genre.is_active)
    redirect_to genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def get_genre
    @genre = Genre.where(id: params[:gid]).first
  end
end

