class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :proverb

    validates :comment, presence: true
end
