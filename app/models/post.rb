class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :post_text, presence: true

end
