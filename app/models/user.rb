class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :password, :twitter, :website, :author, :posts
  has_many :comments
  has_many :comments_from_authored_posts, :class_name => 'Comment', :through => :posts
  has_many :posts
  validates_presence_of :name, :email, :password
  scope :recently_active, User.comments.order("created_at DESC")
  # after_create : send_email
  # before_save :encrypt_password
end


