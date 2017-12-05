class ChargesController < ApplicationController
    before_action :set_categories
  def new
    @grand_total = session[:grand_total]
    @description = "Useful Gadgets Payment"
  end

  def create
    # Amount in cents
    amount = session[:grand_total]

    @customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => @customer.id,
      :amount      => amount.round(0),
      :description => 'Rails Stripe customer',
      :currency    => 'cad'
    )

    #Associate current customer with 3rd party Stripe customer
    customer = Customer.find(session[:id])
    customer.stripe_id = @customer.id
    customer.save

    if @charge.paid && @charge.amount == amount.round(0)
      redirect_to controller: 'customer', action: 'order', id: session[:id]
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to verify_order_path
  end

  private

  def set_categories
    @categories = Category.includes(:products).all.order("name")
  end
end
