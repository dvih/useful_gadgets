class CustomerController < ApplicationController
  before_action :set_categories
  before_action :load_products_in_cart, only: [:verify_order]

  def create
    username = params[:username]
    password = params[:password]
    province_id = params[:province_id]
    postal = params[:postal]

    customer = Customer.create(username: username, password: password, province_id: province_id, postal: postal)
    customer.save

    redirect_to controller: 'customer', action: 'verify_order', id: 1
  end

  def verify_order
    @customer = Customer.find(params[:id])
    @province = @customer.province

    @total_taxes = 1 + ((@province.gst_rate + @province.pst_rate + @province.hst_rate) / 100)
  end

  def order
    customer = Customer.find(params[:id])

    products = Product.find(session[:cart].keys)

    order = Order.create(status: "New", customer_id: customer.id)
    order.save

    order_items = []
    products.each do |order_product|
      order_item = OrderItem.create(quantity: session[:cart][order_product.id].to_i, product_id: order_product.id, order_id: order.id)
      order_item.save
      order_items.push(order_item)
    end

    redirect_to controller: 'product', action: 'show_cart', :notice => "Order completed and logged."
  end

  private

  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end

  def load_products_in_cart
    @products_in_cart = Product.find(session[:cart].keys)
  end
end
