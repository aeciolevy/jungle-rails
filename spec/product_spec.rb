require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:all) do
      @product = Product.new
      @category = Category.new
      @product.name = 'Watch'
      @product.description = 'something else'
      @product.quantity = 3
      @product.price = 200.04
      @product.category = @category
    end

    it "Has all the fields required" do
      expect(@product).to be_valid
    end

    it "Name invalid" do
      @product.name = nil
      expect(@product).to be_invalid
    end

    it "Description invalid" do
      @product.description = nil
      expect(@product).to be_invalid
    end

    it "Quantity invalid" do
      @product.quantity = nil
      expect(@product).to be_invalid
    end

    it "Price invalid" do
      @product.price = nil
      expect(@product).to be_invalid
    end

  end
end