class Proverb < ApplicationRecord
    belongs_to :user

    has_many :post_comments, dependent: :destroy
    has_many :proverb_favorites, dependent: :destroy
    has_many :proverb_bookmarks, dependent: :destroy

    def favorited_by?(user)
        proverb_favorites.where(user_id: user.id).exists?
    end
end
