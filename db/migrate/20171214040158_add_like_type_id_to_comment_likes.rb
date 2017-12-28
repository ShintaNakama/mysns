class AddLikeTypeIdToCommentLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_likes, :like_type_id, :integer
  end
end
