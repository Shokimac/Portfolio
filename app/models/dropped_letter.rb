class DroppedLetter < ApplicationRecord
    validates :body, presence: true
end