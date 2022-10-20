class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    render :new if @order.invalid?
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    #@order.customer_id = current_customer.id
    render :new and return if params[:back] || !@order.save
    redirect_to "complete"
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_status, :shipping_fee, :request_amount, :name, :postal_code, :address)
  end

end
