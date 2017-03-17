class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @new_review = Review.new
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id)
  end

end
