class VolumesController < ApplicationController
  before_action :get_volume, only: [:edit, :update, :toggle]

  def list
    @volumes = Volume.where(book_id: params[:bid])
  end

  def new
    @volume = Volume.new
  end

  def create
    @volume = Volume.new(volume_params)
    @volume.mkdir
    @volume.book_id = params[:bid]
    @volume.img_dir = @volume.set_img
    @volume.pdf_file = @volume.set_pdf
    @volume.page = `ls #{@volume.img_dir}`.split.count
    unless @volume.save
      @volume.rmdir
      render :new and return
    end
    redirect_to volumes_path
  end

  def edit
  end

  def update
    render :edit and return unless @volume.update(volume_params)
    render template: "shared/reload"
  end

  def toggle
    @volume.update(is_active: !@volume.is_active)
    redirect_to volumes_path
  end

  private
  def volume_params
    params.require(:volume).permit(:title, :pdf_file, :cover)
  end

  def get_volume
    @volume = Volume.where(id: params[:vid]).first
  end
end

