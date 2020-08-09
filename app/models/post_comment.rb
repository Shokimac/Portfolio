class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :proverb
end
