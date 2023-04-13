class FavoritesController < ApplicationController
  before_action :set_post 
  before_action :move_to_index 

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    render 'create.js.erb'
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    render 'destroy.js.erb'
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def move_to_index
    unless user_signed_in? || @post.user_id != current_user.id
      redirect_to root_path
    end
  end

end
