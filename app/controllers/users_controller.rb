class UsersController < ApplicationController

  before_action :set_user, only: [:show, :photos_i_like, :photos_i_sub]

  def show
  end

  def photos_i_like
    @photo = @user.like_photos
  end

  def photos_i_sub
    @photo = @user.sub_photos
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end