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
    @products = Product.all.order(created_at: :desc)
    rate_hash = {}
    @products.each do |prod|
      @reviews = Review.where(product_id: prod.id)
      sum = 0
      average = 0
      @reviews.each do |rev|
        sum = sum + rev.rating
      end
      average = sum.to_f / @reviews.size.to_f
      rate_hash[prod.id] = average
    end
    rate_hash
  end

end
