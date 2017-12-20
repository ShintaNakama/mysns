class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @post.comments.create(comment_params)
        redirect_to pages_show_path
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to pages_show_path
    end
    private
    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :body)
    end
end
