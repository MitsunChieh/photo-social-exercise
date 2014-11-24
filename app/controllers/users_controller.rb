class UsersController < ApplicationController

  before_action :set_user, only: [:show, :photos_i_like, :photos_i_sub]

  def show
    @photo = @user.photos
    @title = "User uploaded photos"
  end

  def photos_i_like
    @photo = @user.like_photos
    @title = "User liked photos"
    render :show
  end

  def photos_i_sub
    if current_user == @user
      @photo = @user.sub_photos
      @title = "User subscribed photos"
      render :show
    else
      # raise "HACK!"
      redirect_to photos_i_sub_user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end