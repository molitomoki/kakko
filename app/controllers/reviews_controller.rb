class ReviewsController < ApplicationController
  def create
    Review.create(review_params)
    redirect_to "/posts/#{review.post.id}"
  end

  private
  def review_params
    params.require(:review).permit(:total, :concept, :quality, :usability, :utility, :text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
