class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    @post_background_colour = 0
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
