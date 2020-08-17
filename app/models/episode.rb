class Episode < ApplicationRecord
  belongs_to :user

  has_many :episode_favorites
  has_many :episode_bookmarks

  def self.search(word)
    @episodes = Episode.where('title LIKE?', "%#{word}")
  end
end
