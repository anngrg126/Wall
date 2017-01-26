class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments,
            :through => :posts

EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
validates :name, presence: true, length: {in: 2..20 }
validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: EMAIL_REGEX }
end
