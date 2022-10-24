class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.save
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @delivery = Delivery.find_by(params[:order][:delivery_id])
    #@product = Product.find(order_params[:product_id])
    #@cart_product = CartProduct.find(params[:cart_product_id])
    #cart = Cart.find(params[:cart_id])

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
    if @order.save
      render :new
    end
  end

  def complete
  end

  def index
    @customer = current_customer
    @orders = @customer.orders

  end

  def show
    @order = Order.find(id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_status, :shipping_fee, :request_amount, :name, :postal_code, :address)
  end

end
