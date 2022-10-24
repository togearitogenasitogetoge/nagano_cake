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
    @order.request_amount = @total + 800

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
    @order = current_customer.orders.new(order_params)
    @order.save!
    @cart_items = current_customer.cart_products.all
      @cart_products.each do |cart_product|
        order_products = @order.order_product.new
        order_products.product_id = cart_product.product.id
        order_products.name = cart_product.product.product_name
        order_products.tax_included_price = cart_product.product.tax_included_price
        order_products.quantity = cart_product.quantity
        order_products.save
        current_customer.cart_products.destroy_all
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

  #いらないかも
  def order_product_params
    params.require(:order_product).permit(:order_id, :work_status, :product_id, :quantity, :tax_included_price)
  end

end
