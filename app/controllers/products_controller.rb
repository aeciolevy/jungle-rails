class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = @product.reviews.new
    @reviews = Review.where(product_id: @product.id).order(:created_at).reverse_order
  end

end
