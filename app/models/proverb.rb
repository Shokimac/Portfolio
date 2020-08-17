class Proverb < ApplicationRecord
    belongs_to :user

    has_many :post_comments, dependent: :destroy
    has_many :proverb_favorites, dependent: :destroy
    has_many :proverb_bookmarks, dependent: :destroy

    def self.search(word)
        @proverbs = Proverb.where('body LIKE?', "%#{word}")
      end
end
