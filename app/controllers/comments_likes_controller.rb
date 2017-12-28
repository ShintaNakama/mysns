class CommentsLikesController < ApplicationController
    protect_from_forgery except: [:create, :destroy]
    require 'json'
    
    def create

        case params[:like_type_id]
        when "1"
            @commentlike = CommentLike.create(user_id: current_user.id, post_id: params[:post_id], comment_id: params[:comment_id], like_type_id: params[:like_type_id])
            @data = Hash.new
            if @commentlike.nil?
                @data["result"] ="NG"
            else
                @data["result"] ="OK"
            end
            @data["commentslikescount"] = Comment.find(params[:comment_id]).comment_likes.where(like_type_id: params[:like_type_id]).count
        when "2"
            @commentbad = CommentLike.create(user_id: current_user.id, post_id: params[:post_id], comment_id: params[:comment_id], like_type_id: params[:like_type_id])
            @data = Hash.new
            if @commentbad.nil?
                @data["result"] ="NG"
            else
                @data["result"] ="OK"
            end
            @data["commentsbadscount"] = Comment.find(params[:comment_id]).comment_likes.where(like_type_id: params[:like_type_id]).count
        when "3"
            @commentgreat = CommentLike.create(user_id: current_user.id, post_id: params[:post_id], comment_id: params[:comment_id], like_type_id: params[:like_type_id])
            @data = Hash.new
            if @commentgreat.nil?
                @data["result"] ="NG"
            else
                @data["result"] ="OK"
            end
            @data["commentsgreatscount"] = Comment.find(params[:comment_id]).comment_likes.where(like_type_id: params[:like_type_id]).count
        end

        
        render plain: @data.to_json
    end

    def destroy
        @commentlike = CommentLike.find_by(user_id: current_user.id, post_id: params[:post_id], comment_id: params[:comment_id])
        @commentlike.destroy!

        @data = Hash.new
        if @commentlike.nil?
            @data["result"] ="NG"
        else
            @data["result"] ="OK"
        end
        @data["commentslikescount"] = Comment.find(params[:comment_id]).comment_likes.count
        render plain: @data.to_json
    end

end
