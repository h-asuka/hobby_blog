class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy #ユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end

