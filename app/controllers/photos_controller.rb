class PhotosController < ApplicationController

  before_action :set_photo, only: [:show, :edit, :update, :destroy,
                                   :like, :unlike, :subscribe, :unsubscribe]

  def index
    @photo = Photo.order("id DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new( photo_params )
    @photo.user = current_user
    @photo.save

    redirect_to photos_path
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @photo.update(description: photo_params[:description])

    redirect_to photo_path(@photo)
  end

  def destroy
    @photo.delete

    redirect_to photos_path
  end

  def like
    @like = @photo.likes.build
    @like.user = current_user
    @like.save

    redirect_to photo_path(@photo)
  end

  def unlike
    @like = @photo.find_like_by_user(current_user)
    @like.destroy if @like

    redirect_to photo_path(@photo)
  end

  def subscribe
    @sub = @photo.subscribes.build
    @sub.user = current_user
    @sub.save

    redirect_to photo_path(@photo)
  end

  def unsubscribe
    @sub = Subscribe.where( user_id: current_user.id, photo_id: @photo.id ).first
    @sub.destroy

    redirect_to photo_path(@photo)
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:img, :description)
  end

end
