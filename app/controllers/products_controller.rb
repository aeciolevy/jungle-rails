class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc)
    @average = calculate_average
  end

  def show
    @product = Product.find params[:id]
    @new_review = @product.reviews.new
    @reviews = Review.where(product_id: @product.id).order(:created_at).reverse_order
  end

  private

  def calculate_average
    @products = Product.order(created_at: :desc)
    rate_hash = {}
    @products.each do |prod|
      rate_hash[prod.id] = prod.avg_rating.to_f
    end
    rate_hash
  end

end
