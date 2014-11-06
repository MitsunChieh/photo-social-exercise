class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  has_many :subscribes, dependent: :destroy
  has_many :photos, through: :subscribes

  has_many :comments
  has_many :photos, through: :comments

  has_many :likes, dependent: :destroy
  has_many :photos, through: :likes

end
