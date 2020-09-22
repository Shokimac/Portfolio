class Episode < ApplicationRecord
  belongs_to :user

  has_many :episode_favorites
  has_many :episode_bookmarks

  validates :title, presence: true, length: {maximum: 80} 
  validates :body, presence: true, length: {maximum: 500} 

  def self.search(word)
    @episodes = Episode.where("title Like ?", "%#{word}%")
  end

  def favorited_by?(user)
    episode_favorites.where(user_id: user.id).exists?
  end

  def bookmarked_by?(user)
    episode_bookmarks.where(user_id: user.id).exists?
  end
end