class Proverb < ApplicationRecord
    belongs_to :user

    has_many :post_comments, dependent: :destroy
    has_many :proverb_favorites, dependent: :destroy
    has_many :proverb_bookmarks, dependent: :destroy

    validates :name, presence: true
    validates :body, presence: true
    validates :introduction, presence: true

    def self.search(word)
        @proverbs = Proverb.where('name Like ?', "%#{word}%")
      end

    def favorited_by?(user)
        proverb_favorites.where(user_id: user.id).exists?
    end

    def bookmarked_by?(user)
        proverb_bookmarks.where(user_id: user.id).exists?
    end
end
