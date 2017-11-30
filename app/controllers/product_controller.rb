class ProductController < ApplicationController
  before_action :set_categories, only: [:show]
  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end

  def show
    @product = Product.find(params[:id])
  end

  def cart

  end

  def add_to_cart
    id = params[:id].to_i
    render plain: "Adding product with id #{id}"
  end
end
