class PostsController < ApplicationController
  before_action :authenticate_user! ,only: [:new, :edit, :destroy]
  before_action :set_post ,only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update, :destory]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @reviews = @post.reviews.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless @post.user_id == current_user.id
      redirect_to action: :index
    end
  end
end
