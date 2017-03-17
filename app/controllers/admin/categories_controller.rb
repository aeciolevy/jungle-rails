class Admin::CategoriesController < ApplicationController

  before_filter :http_basic_auth

  def index
    @category = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created'
    else
      render :new
    end
  end

  private
  def categories_params
    params.require(:category).permit(
      :name
    )
  end

end
