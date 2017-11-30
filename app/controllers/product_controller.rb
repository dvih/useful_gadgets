class ProductController < ApplicationController
  before_action :set_categories, only: [:show]
  before_action :initialize_session

  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end

  def show
    @product = Product.find(params[:id])
  end

  def view_cart

  end

  def add_to_cart
    # get product id
    id = params[:id].to_i
    # push product to session
    session[:cart] << id unless session[:cart].include?(id)

    redirect_to request.referer
  end

  private

  def initialize_session
    # if cart is not initialized
    session[:cart] ||= []
  end
end
