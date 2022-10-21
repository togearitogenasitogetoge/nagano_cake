class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer

    @deliveries = Delivery.where(customer_id: current_customer.id)

    @delivery = @customer.deliveries.new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)

    if @order.invalid?
      render :new
    end

    @delivery = @customer.deliveries.new(delivery_params)

  end

  def create
    @order = Order.new(order_params)

    @order.customer_id = current_customer.id

    #render :new and return if params[:back] || !

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
    @order = Order.find_by(id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_status, :shipping_fee, :request_amount, :name, :postal_code, :address)
  end

  def delivery_params
    params.require(:delivery).permit(:customer_id, :postal_code, :address, :name)

    # customerid必要？

  end

end
