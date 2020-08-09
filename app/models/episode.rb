class Episode < ApplicationRecord
    belongs_to :user

    has_many :episode_favorites
    has_many :episode_bookmarks
    
end
