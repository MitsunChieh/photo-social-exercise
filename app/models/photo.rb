class Photo < ActiveRecord::Base
  belongs_to :photo

  has_many :subscribes, dependent: :destroy
  has_many :phtos, through: :subscribes

  has_many :comments, dependent: :destroy
  has_many :phtos, through: :comments

  has_many :likes, dependent: :destroy
  has_many :phtos, through: :likes
end
