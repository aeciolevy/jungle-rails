class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id].to_i
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      redirect_to "/"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating,
    )
  end

end
