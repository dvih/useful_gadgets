class CategoryController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]
    province_id = params[:province_id]

    @customer = Customer.create(name: username, password: password, province_id: province_id)
  end

end
