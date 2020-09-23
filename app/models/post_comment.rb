class PostComment < ApplicationRecord
    belongs_to :user
    belongs_to :proverb

    validates :comment, presence: true, length: {maximum: 40} 
end
