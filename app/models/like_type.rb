class LikeType < ApplicationRecord
    
    has_many :comment_likes, dependent: :destroy
    has_many :likes, dependent: :destroy
end
