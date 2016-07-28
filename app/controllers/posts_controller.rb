class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

private

  def trail_params
    params.require(:post).permit(:image, :title, :body)
  end

end
