class IndexController < ApplicationController
  def index
    @categories = Category.includes(:products).all
  end
end
