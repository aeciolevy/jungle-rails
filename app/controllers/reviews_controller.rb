class ReviewsController < ApplicationController

    before_filter :require_login, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
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
    if !current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/sessions/new"
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
