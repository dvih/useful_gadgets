class CategoryController < ApplicationController
  before_action :set_categories, only: [:index, :show]
  def set_categories
    @categories = Category.includes(:products).all
  end

  def index

  end

  def show
    @category = Category.find(params[:id])
  end
end
