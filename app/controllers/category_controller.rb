class CategoryController < ApplicationController
  before_action :set_categories, only: [:index, :show, :search]
  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end

  def index

  end

  def show
    @category = Category.find(params[:id])
  end

  def search
    @query = "#{params[:query]}"
    @search_category = "#{params[:search_category]}"
    @searched_category = Category.where("id = ? ", "#{@search_category}").first

    @search_category_name = nil
    @search_category_name = @searched_category.name unless @searched_category.nil?

    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{@query}%", "%#{@query}%")

    if @search_category != '-1'
      @search_results = Category.joins(:products).where("category_id = ?", "#{@search_category}").where(:products => {:id => @products.map{|x| x.id}}).distinct
    else
      @search_results = Category.joins(:products).where(:products => {:id => @products.map{|x| x.id}}).distinct
    end
  end
end
