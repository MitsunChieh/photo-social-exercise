class PhotoCommentsController < ApplicationController

  before_action :find_photo
  before_action :find_comment, only: :destroy

  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user
    @comment.save

    redirect_to photo_path(@photo)
  end

  def destroy
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
