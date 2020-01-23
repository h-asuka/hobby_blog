class User < ApplicationRecord

  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  mount_uploader :image, ImageUploader
end

