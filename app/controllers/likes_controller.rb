class LikesController < ApplicationController
  protect_from_forgery except: [:create, :destroy]
  require 'json'
     def create
        
        @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
        
        # @likes = Like.where(post_id: params[:post_id])
        @data = Hash.new
        if @like.nil?
          @data["result"] ="NG"
        else
          @data["result"] ="OK"
        end
        @data["likescount"] = Post.find(params[:post_id]).likes.count
        #@data = {"result" => "ok", "likes_count" => @post.likes_count}
        render plain: @data.to_json
      end
    
      def destroy
  
        @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
        @like.destroy!
        # @likes = Like.where(post_id: params[:post_id])
        
        # @data = {"result" => "ok", "likes_count" => @post.likes_count}
        # @data.to_JSON
        @data = Hash.new
        if @like.nil?
          @data["result"] ="NG"
        else
          @data["result"] ="OK"
        end
        @data["likescount"] = Post.find(params[:post_id]).likes.count
        render plain: @data.to_json
      end
end
