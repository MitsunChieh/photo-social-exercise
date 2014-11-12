class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy

  has_many :subscribes, dependent: :destroy
  has_many :sub_photos, through: :subscribes, source: :photo

  has_many :comments
#  has_many :com_photos, through: :comments, :source => :photo

  has_many :likes, dependent: :destroy
  has_many :like_photos, through: :likes, source: :photo

end
