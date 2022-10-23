class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @delivery = Delivery.find(params[:order][:delivery_id])
    @cart_products = current_customer.cart_products
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
    @request_amount = @cart_products.inject(0) { |sum, product| sum + product.subtotal + 800 }

    if params[:order][:select_address] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.first_name + @customer.family_name
    elsif params[:order][:select_address] == "1"
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code
      @order.address
      @order.name
    end
  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer
    if @order.save!
      redirect_to "complete"
    end
  end

  def complete
  end

  def index
    @customer = current_customer
    @orders = @customer.orders

  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_status, :shipping_fee, :request_amount, :name, :postal_code, :address)
  end

end
