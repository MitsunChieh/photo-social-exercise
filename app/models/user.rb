class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy

  has_many :subscribes, dependent: :destroy
  has_many :photos, through: :subscribes

  has_many :comments
  has_many :photos, through: :comments

  has_many :likes, dependent: :destroy
  has_many :photos, through: :likes

end
