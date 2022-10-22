class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    #if 配送先のorder selectadd指定する　== "0"
    #binding.pry
  end

  def create
    @order = Order.new(order_params)
    @customer = current_customer

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
