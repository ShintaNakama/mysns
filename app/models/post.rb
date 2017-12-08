class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :title, presence: true, length: { maximum: 40}
    validates :body, presence: true, length: { maximum: 250}
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
    
end
