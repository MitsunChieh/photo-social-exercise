class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :subscribes, dependent: :destroy
  has_many :users, through: :subscribes

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
