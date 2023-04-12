class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
end
