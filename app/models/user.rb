class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy

  has_many :subscribes, dependent: :destroy
  has_many :phtos, through: :subscribes

  has_many :comments
  has_many :phtos, through: :comments

  has_many :likes, dependent: :destroy
  has_many :phtos, through: :likes

end
