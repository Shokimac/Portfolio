class ProverbFavorite < ApplicationRecord
    belongs_to :user
    belongs_to :proverb
end
