class Inquiry < ApplicationRecord
  validates :name, presence: true, length: {maximum: 40} 
  validates :message, presence: true, length: {maximum: 300} 
end
