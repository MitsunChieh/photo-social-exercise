class AddImgToPhotos < ActiveRecord::Migration
  def change
    add_attachment :photos, :img
  end
end
