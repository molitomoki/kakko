class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :image).merge(user_id: current_user.id)
  end
end
