class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_categories, only: [:index, :show]
  def set_categories
    @categories = Category.includes(:products).all
  end
end
