class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to post_path(@review.post)
    else
      @post = @review.post
      @reviews = @post.reviews
      render "posts/show"
    end
  end

  private
  def review_params
    params.require(:review).permit(:total, :concept, :quality, :usability, :utility, :text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
