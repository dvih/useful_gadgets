class ProductController < ApplicationController
  before_action :set_categories
  before_action :initialize_session
  before_action :load_products_in_cart, only: [:show_cart]

  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end

  def show
    @product = Product.find(params[:id])
  end

  def show_cart

  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)

    product_name = Product.find(id).name
    redirect_to request.referer, notice: "Removed #{product_name} from the "
  end

  def add_to_cart
    # get product id
    id = params[:id].to_i
    # push product to session
    session[:cart] << id unless session[:cart].include?(id)

    product_name = Product.find(id).name
    redirect_to request.referer, notice: "Added #{product_name} to the "
  end

  private

  def initialize_session
    # if cart is not initialized
    session[:cart] ||= []
  end

  def load_products_in_cart
    @products_in_cart = Product.find(session[:cart])
  end
end
