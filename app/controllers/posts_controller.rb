class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    params.permit!
    @post = Post.new(params[:post])
    @post.user_id = 1
    if @post.save
      redirect_to @post
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    params.permit!
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
