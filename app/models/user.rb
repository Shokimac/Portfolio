class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attachment :image
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  :omniauthable

  has_many :episodes, dependent: :destroy
  has_many :episode_favorites, dependent: :destroy
  has_many :episode_bookmarks, dependent: :destroy
  has_many :proverbs, dependent: :destroy
  has_many :proverb_favorites, dependent: :destroy
  has_many :proverb_bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
