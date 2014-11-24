class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :subscribes, dependent: :destroy
  # has_many :users, through: :subscribes

  has_many :comments, dependent: :destroy
  # has_many :comment_users, through: :comments, source: :user

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/

  def can_be_liked?(user)
    find_like_by_user(user).nil?
  end

  def find_like_by_user(user)
    self.likes.where( user_id: user.id ).first
  end

  def can_be_delete?(user)
    self.user == user
  end

  def can_be_sub?(user)
    self.subscribes.where( user_id: user.id ).empty?
  end

end
