class PostsController < ApplicationController
    require 'json'
    def show
        @user = current_user.id
        @post = Post.find(params[:id])
        @like = Like.find_by(user_id: current_user.id, post_id: params[:id])
        @data = JSON.dump({"result" => "ok", "likes_count" => @post.likes.count})
        @dataLikesCount = @data["likes_count"]
        
        # @likes = Like.where(post_id: params[:id])
    end

    def new
        @post = Post.new
        @postuserid = current_user.id
        @postuser = current_user.username
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to pages_show_path
        else
            # render plain: @post.errors.inspect 
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        @postuser = current_user.username
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to pages_show_path
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to pages_show_path
    end


    private
    def post_params
        params.require(:post).permit(:user_id, :title, :body)
    end
end
