class DroppedLetter < ApplicationRecord
    validates :body, presence: true, length: {maximum: 80} 
end