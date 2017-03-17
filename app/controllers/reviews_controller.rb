class ReviewsController < ApplicationController

    before_filter :require_login, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@review.product_id)
    else
      redirect_to product_path(@review.product_id)
    end
  end

  def destroy
    @rev = Review.find(params[:id])
    @rev.destroy
    flash[:notice] = "Review deleted"
    redirect_to product_path(@rev.product_id)
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
