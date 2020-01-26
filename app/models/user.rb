class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy #ユーザーがデータベースから削除されてしまった場合にユーザーがした投稿も全て消える

  mount_uploader :image, ImageUploader
end

