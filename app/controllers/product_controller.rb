class ProductController < ApplicationController
  before_action :set_categories, only: [:show]
  def set_categories
    @categories = Category.includes(:products).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
