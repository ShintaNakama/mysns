class PagesController < ApplicationController
  def index
  end

  def show
    @posts = Post.all.order(created_at:'desc')
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  
end
