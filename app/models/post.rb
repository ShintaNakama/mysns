class Post < ApplicationRecord
    belongs_to :user, optional: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comment_likes, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true
end
