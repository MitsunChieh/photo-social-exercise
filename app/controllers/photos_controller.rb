class PhotosController < ApplicationController

  before_action :set_photo, only: [:show, :destroy]

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new( user_params )
    @photo.user = current_user
    @photo.save

    redirect_to photos_path
  end

  def show
  end

  def destroy
    @photo.delete

    redirect_to photos_path
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def user_params
    params.require(:photo).permit(:img)
  end

end
