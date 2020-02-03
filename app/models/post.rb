class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy #投稿が消えたらお気に入りも消える
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

end
